#!/usr/bin/env zsh
#
# .zshrc - Zsh file loaded in interactive shell sessions.
#

setopt extended_glob

zsh_config_path="${HOME}/.config/zsh"

fpath=(${zsh_config_path}/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

source ${zsh_config_path}/.zstyles

unset zsh_config_path

#
# Antidote - https://getantidote.github.io
#

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

#
# Starship - https://starship.rs
#

eval "$(starship init zsh)"

#
# rbenv - https://github.com/rbenv/rbenv
#

eval "$(rbenv init - zsh)"
