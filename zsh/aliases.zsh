alias virt-import-ova="LANG=en_US.UTF-8 virt-v2v -o libvirt -of qcow2 -os default -i ova"
alias libreoffice-to-pdf="libreoffice --headless --convert-to pdf"
alias libreoffice-print="libreoffice -p"
alias remove-known-host="ssh-keygen -R"
alias curl-headers="curl -sSLD - -o /dev/null"
alias ffprobe-clear="ffprobe -hide_banner"
alias login-log="journalctl -u systemd-logind | grep $USER | tail"
alias qrcode="qrencode -t ansiutf8"
alias rsync="rsync -azh --stats --info=progress2"
alias rsync-bitrix="rsync -azh --stats --info=progress2 --exclude=bitrix/{backup,cache,catalog_export,html_pages,managed_cache,stack_cache,tmp,updates} --exclude=upload/{1c_catalog,1c_exchange,resize_cache,tmp}"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias myip6="dig +short -6 myip.opendns.com aaaa @resolver1.ipv6-sandbox.opendns.com"
alias dotfiles="code ${DOTFILES_ZSH:a:h}"
alias dotfiles-pull="git -C ${DOTFILES_ZSH:a:h} pull && source $HOME/.zshrc"
alias dotfiles-push="git -C ${DOTFILES_ZSH:a:h} push"
alias find-bom-files="grep -rlI $'\xEF\xBB\xBF'"
alias dotfiles-edit="code ${DOTFILES_ZSH:a:h}"
alias wget-site="wget -pkr"
alias gvfs-restart="systemctl --user restart gvfs-daemon.service"
alias time="$(which time) -p"
alias youtube-info="youtube-dl -F"
alias youtube-mp4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
alias youtube-mp3="youtube-dl -x --audio-format mp3"
alias youtube-byid="youtube-dl -f"
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
alias hex='hexdump -C'
alias stress-full-5m='stress-ng --sequential 0 -t 5m'
alias ssh-config="${EDITOR:-vi} ~/.ssh/config"
alias docker-compose="docker compose"
alias uart-console="sudo screen /dev/ttyUSB0 115200"
alias qr='qrencode -m 2 -t utf8 <<< "$1"'

