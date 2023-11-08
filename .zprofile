#!/usr/bin/env zsh
#
# .zprofile - Zsh file loaded on login.
#

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
# Remove duplicates in $FPATH and $PATH
#

typeset -gU fpath path

#
# Browser
#

export BROWSER="${BROWSER:-open}"

#
# Dotfiles - https://github.com/jgarber623/dotfiles
#

export DOTFILES="${${(%):-%x}:A:h}"

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

SECRETIVE_SSH_AUTH_SOCK="${HOME}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

[ -S "${SECRETIVE_SSH_AUTH_SOCK}" ] && export SSH_AUTH_SOCK="${SECRETIVE_SSH_AUTH_SOCK}"

#
# Terminal
#

export TERM="xterm-256color"
