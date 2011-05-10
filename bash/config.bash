export EDITOR="mate -w"
export HISTCONTROL=erasedups
export PATH="/usr/local/bin:$PATH"

PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
PS1='\[\033[1;36m\]\h: \[\033[00m\]\w\[\033[0;33m\]$(__git_ps1)\[\033[00m\] \u \$ '