HISTFILE=~/.zsh_history
HISTSIZE=100
SAVEHIST=100

setopt APPEND_HISTORY # adds history
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS # don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY SHARE_HISTORY # adds history incrementally and share it across sessions
setopt SHARE_HISTORY # share history between sessions ???