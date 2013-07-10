export CC="/usr/local/bin/gcc-4.2"
export EDITOR="subl -w"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

fpath=($ZSH/zsh/functions $fpath)

setopt COMPLETE_IN_WORD
setopt CORRECT
setopt IGNORE_EOF
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt PROMPT_SUBST

# Set terminal window title to display current path
case $TERM in
	xterm*)
		precmd () {print -Pn "\e]0;%~\a"}
	;;
esac