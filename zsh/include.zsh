export DOTFILES_ZSH=${0:a:h}

source $DOTFILES_ZSH/env.zsh
source $DOTFILES_ZSH/aliases.zsh
source $DOTFILES_ZSH/functions.zsh


[ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh