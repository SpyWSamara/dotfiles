function show-cert() {
    for ((i = 1; i <= $#; i++)); do
        site=$(echo $@[i] | tr '[:upper:]' '[:lower:]')
        echo 'Check site: '$site
        printf %"$COLUMNS"s | tr " " "-"
        echo -n | openssl s_client -servername $site -connect $site:443 2>/dev/null | openssl x509 -noout -text
        [[ $i -lt $# ]] && printf %"$COLUMNS"s | tr " " "="
    done
}

function global-share() {
    ssh -R 80:"${1:-localhost}":"${2:-8080}" ssh.localhost.run
}

function php-serv() {
    php -S localhost:"${1:-8080}"
}

function php-serv-pub() {
    php -S 0.0.0.0:"${1:-8080}"
}

function show-ssl-ciphers() {
    serverport=$1
    echo testing against $serverport

    for v in ssl2 ssl3 tls1 tls1_1 tls1_2 tls1_3; do
        for c in $(openssl ciphers 'ALL:eNULL' | tr ':' ' '); do
            openssl s_client -connect $serverport -cipher $c -$v </dev/null >/dev/null 2>&1 && echo -e "$v:\t$c"
        done
    done
}

function memory() {
    local PID=$(pgrep -o $1)
    [[ $PID ]] && top -p $PID
}

function theme-spaceship() {
    local LOCAL_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt"

    if [[ -d "$LOCAL_PATH" ]]; then
        git -C "$LOCAL_PATH" pull --ff-only
    else
        git clone --depth=1 https://github.com/denysdovhan/spaceship-prompt.git "$LOCAL_PATH"
    fi
}

function theme-punctual() {
    local LOCAL_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/punctual-zsh-theme"

    if [[ -d "$LOCAL_PATH" ]]; then
        git -C "$LOCAL_PATH" pull --ff-only
    else
        git clone --depth=1 https://github.com/dannynimmo/punctual-zsh-theme.git "$LOCAL_PATH"
    fi
}

function theme-powerlevel10k() {
    local LOCAL_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

    if [[ -d "$LOCAL_PATH" ]]; then
        git -C "$LOCAL_PATH" pull --ff-only
    else
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$LOCAL_PATH"
    fi
}

function ftp-mount() {
    local USER=$1
    local PASSWORD=$2
    local SERVER=$3
    local PORT="${4:-21}"
    local MOUNT_PATH="/tmp/${USER}_${SERVER}"

    [ -d $MOUNT_PATH ] || mkdir -p $MOUNT_PATH

    if [[ $(findmnt -M "$MOUNT_PATH") ]]; then
        fusermount -u $MOUNT_PATH
    else
        curlftpfs $USER:$PASSWORD@$SERVER:$PORT $MOUNT_PATH && xdg-open $MOUNT_PATH
    fi
}

function redirects() {
    autoload -U colors && colors
    local URL=$1
    local LIMIT=${2:-15}
    local ITTERATION=0

    echo $fg_bold[green]$URL$reset_color

    while [ "$ITTERATION" -le "$LIMIT" ]; do
        declare -A RESULT=()
        while read -r KEY VALUE; do
            RESULT[$KEY]="$VALUE"
        done <<< $(curl -so /dev/null -w "http %{http_version}\ncode %{http_code}\nurl %{redirect_url}" "$URL")

        COLOR=''
        [[ $RESULT[http] -eq 2 ]] && COLOR=$fg[green]
        local HTTP="HTTP/$COLOR${(r:4:)RESULT[http]}$reset_color"
        COLOR=$fg_bold[black]$bg[red]

        if [[ -z $RESULT[url] ]]; then
            [[ $(($RESULT[code])) -eq 200 ]] && COLOR=$fg[green]
            echo $HTTP"[$COLOR${(r:3:)RESULT[code]}$reset_color]"
            break
        else
            [[ $(($RESULT[code])) -eq 301 || $(($RESULT[code])) -eq 308 ]] && COLOR=$fg[yellow]
            local CODE="[$COLOR${(r:3:)RESULT[code]}$reset_color] "
            COLOR=$fg[yellow]
            local NEXT_URL=">> $COLOR$RESULT[url]$reset_color"
            echo "$HTTP$CODE$NEXT_URL"
            URL=$RESULT[url]
        fi

        ITTERATION=$(($ITTERATION + 1))
    done
}

function remote-partition-copy() {
    if [ "$#" -ne 3 ]; then
        echo 'remote-partition-copy {connection} {partition} {localpath}'
        echo 'Where:'
        echo '    {connection} "like user@ip" or "-p 2022 user@ip"'
        echo '    {partition} like "vda2" or "sda1"'
        echo '    {localpath} absolute path to save like "/tmp/my.img" or "/home/user/server.vda2.img"'
        return 1;
    fi

    local CONNECTION=$1
    local PARTITION=$2
    local LOCAL_PATH=$3
    ssh "$CONNECTION" "sudo dd if=/dev/$PARTITION status=progress | gzip -1 -" | dd of=$LOCAL_PATH.gz

}


# https://bugs.chromium.org/p/chromium/issues/detail?id=1442633
function chromium-render-fix() {
    for browser in chromium BraveSoftware google-chrome yandex-browser
    do 
        local searchdir="$HOME/.config/$browser/"
        [ -d "$searchdir" ] && find "$searchdir" -type d -name "GPUCache" | xargs rm -rf
    done
}
