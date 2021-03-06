function install-zsh() {
    sudo dnf install zsh zsh-syntax-highlighting
    sudo usermod --shell $(which zsh) $USER
}

function install-rpmfusion() {
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

function install-vscode() {
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf check-update
    sudo dnf install code
}

function install-vms() {
    sudo dnf install virt-manager VirtualBox podman
}

function install-intel() {
    if [[ $(lspci | grep Intel | grep VGA) ]]; then
        sudo dnf install intel-mediasdk libva-intel-driver libva-intel-hybrid-driver xorg-x11-drv-intel libva-vdpau-driver libva-utils
    fi
}

function install-nvidia() {
    if [[ $(lspci | grep NVIDIA | grep VGA) ]]; then
        sudo dnf install "kernel-devel-$(uname -r)" akmod-nvidia xorg-x11-drv-nvidia-cuda vdpauinfo libva-vdpau-driver libva-utils
    fi
}

function install-php() {
    sudo dnf install php php-cs-fixer composer
}

function install-nodejs() {
    sudo dnf install nodejs
}

function install-themes() {
    sudo dnf install gnome-tweaks papirus-icon-theme breeze-cursor-theme
}

function install-software() {
    sudo dnf install telegram-desktop transmission-gtk discord htop vim git p7zip curl wget keepassxc wireguard-tools remmina chromium-freeworld vlc ffmpeg syncthing flameshot ulauncher wmctrl
}

function install-flathub() {
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install Spotify
}

function install-all() {
    install-zsh
    install-rpmfusion
    install-vscode
    install-vms
    install-intel
    install-nvidia
    install-php
    install-nodejs
    install-themes
    install-flathub
    install-software
}
