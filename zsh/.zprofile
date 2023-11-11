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

homebrew_prefix="/opt/homebrew"

[[ $(uname) == "Darwin" && $(uname -m) == "x86_64" ]] && homebrew_prefix="/usr/local"
[[ $(uname) == "Linux" ]] && homebrew_prefix="/home/linuxbrew/.linuxbrew"

eval "$(${homebrew_prefix}/bin/brew shellenv)"

unset homebrew_prefix

export HOMEBREW_BAT="true"
export HOMEBREW_BOOTSNAP="true"
export HOMEBREW_DISPLAY_INSTALL_TIMES="true"
export HOMEBREW_NO_ANALYTICS="true"
export HOMEBREW_NO_INSECURE_REDIRECT="true"

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
