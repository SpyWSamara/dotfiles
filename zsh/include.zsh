export DOTFILES_ZSH=${0:a:h}

source $DOTFILES_ZSH/env.zsh
source $DOTFILES_ZSH/aliases.zsh
source $DOTFILES_ZSH/functions.zsh
source $DOTFILES_ZSH/install.zsh

if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi