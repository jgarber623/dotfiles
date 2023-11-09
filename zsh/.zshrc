#!/usr/bin/env zsh
#
# .zshrc - Zsh file loaded in interactive shell sessions.
#

setopt extended_glob

fpath=(${XDG_CONFIG_HOME}/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

source ${XDG_CONFIG_HOME}/zsh/.zstyles

#
# Antidote - https://getantidote.github.io
#

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load
