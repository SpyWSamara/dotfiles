export EDITOR='vim'
export PATH="$HOME/.local/bin:$PATH:$HOME/.cargo/bin"
export PASSWORD_STORE_GPG_OPTS="--armor"

[ -x "$(command -v go)" ] && export PATH="$PATH:$HOME/go/bin"
