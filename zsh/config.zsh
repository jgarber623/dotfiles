export EDITOR="mate -w"
export PATH="/usr/local/bin:$PATH"

fpath=($ZSH/zsh/functions $fpath)

autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100

setopt SHARE_HISTORY