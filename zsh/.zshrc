#!/usr/bin/env zsh

setopt extended_glob

# Autoload functions
fpath=(${XDG_CONFIG_HOME}/zsh/functions $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Remove duplicates in $FPATH and $PATH
typeset -gU fpath path

# Completion styles, etc.
source ${XDG_CONFIG_HOME}/zsh/.zstyles

# Source configuration files
for config in "${XDG_CONFIG_HOME}/zsh/configs"/**/*(N-.); do
  source $config
done

# Source local configuration files
[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# Antidote - https://getantidote.github.io
antidote_script_path="$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

if [[ -s $antidote_script_path ]]; then
  source $antidote_script_path
  antidote load
fi

unset antidote_script_path
