alias ssh-copy-my="ssh-copy-id -i ~/.ssh/id_rsa"
alias virt-import-ova="LANG=en_US.UTF-8 virt-v2v -o libvirt -of qcow2 -os default -i ova"
alias libreoffice-to-pdf="libreoffice --headless --convert-to pdf"
alias libreoffice-print="libreoffice -p"
alias remove-known-host="ssh-keygen -R"
alias ssh-config="code ~/.ssh/config"
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
alias gvfs-restart="systemctl restart gvfs-daemon.service"
alias time="$(which time) -p"
