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

export DOTDIR="${HOME}/.dotfiles"

#
# Editors/Pagers
#

export EDITOR="${EDITOR:-nano}"
export VISUAL="${VISUAL:-atom --new-window --wait}"
export PAGER="${PAGER:-less}"
export LESS="-FMR"

#
# Git - https://git-scm.com/docs/git-config
#

export GIT_AUTHOR_NAME="${USER_NAME}"
export GIT_AUTHOR_EMAIL="${USER_EMAIL}"
export GIT_COMMITTER_NAME="${USER_NAME}"
export GIT_COMMITTER_EMAIL="${USER_EMAIL}"

#
# ohmyzsh - https://github.com/ohmyzsh/ohmyzsh
#

export ZSH="${HOME}/.oh-my-zsh"
export ZSH_COLORIZE_STYLE="friendly"

#
# Secretive - https://github.com/maxgoedjen/secretive
#

SECRETIVE_SSH_AUTH_SOCK="${HOME}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

[ -S "${SECRETIVE_SSH_AUTH_SOCK}" ] && export SSH_AUTH_SOCK="${SECRETIVE_SSH_AUTH_SOCK}"

#
# Terminal
#

export TERM="xterm-256color"
