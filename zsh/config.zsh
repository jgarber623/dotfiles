fpath=($ZSH/functions $fpath)

HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100

setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_HISTORY # Add timestamps to history
setopt HIST_VERIFY
setopt IGNORE_EOF
setopt LOCAL_OPTIONS # Allow functions to have local options
setopt LOCAL_TRAPS # Allow functions to have local traps
setopt NO_BG_NICE # Don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt PROMPT_SUBST
setopt SHARE_HISTORY # Share history between sessions ???

setopt APPEND_HISTORY # Adds history
setopt HIST_IGNORE_ALL_DUPS # Don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY # Adds history incrementally and shares it across sessions

# Don't expand aliases _before_ completion has finished
#   example: git comm-[tab]
setopt complete_aliases
