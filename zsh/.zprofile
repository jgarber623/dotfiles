#!/usr/bin/env zsh
#
# .zprofile - Zsh file loaded on login.
#

#
# Remove duplicates in $FPATH and $PATH
#

typeset -gU fpath path

#
# Secrets
#

[[ -s $HOME/.zprofile.local ]] && source $HOME/.zprofile.local

#
# Homebrew - https://brew.sh
#

eval "$(/opt/homebrew/bin/brew shellenv)"

HOMEBREW_BAT="true"
HOMEBREW_BOOTSNAP="true"
HOMEBREW_DISPLAY_INSTALL_TIMES="true"
HOMEBREW_NO_ANALYTICS="true"
HOMEBREW_NO_INSECURE_REDIRECT="true"

#
# Browser
#

export BROWSER="${BROWSER:-open}"

#
# Dotfiles - https://github.com/jgarber623/dotfiles
#

export DOTFILES="$(cd -- "${${(%):-%x}:A:h}/.." > /dev/null 2>&1 && pwd)"

#
# Editors/Pagers
#

export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-atom --new-window --wait}"
export PAGER="${PAGER:-less}"
export LESS="-FMR"

#
# Secretive - https://github.com/maxgoedjen/secretive
#

secretive_ssh_auth_sock="${HOME}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

[[ $OSTYPE == "darwin"* && -S "${secretive_ssh_auth_sock}" ]] && export SSH_AUTH_SOCK="${secretive_ssh_auth_sock}"

unset secretive_ssh_auth_sock

#
# Terminal
#

export TERM="xterm-256color"

#
# User
#

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

#
# Zsh
#

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,underline"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="git commit *"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
