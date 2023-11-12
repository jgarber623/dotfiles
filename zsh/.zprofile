#!/usr/bin/env zsh

homebrew_prefix="/opt/homebrew"

[[ $(uname) == "Darwin" && $(uname -m) == "x86_64" ]] && homebrew_prefix="/usr/local"
[[ $(uname) == "Linux" ]] && homebrew_prefix="/home/linuxbrew/.linuxbrew"

eval "$(${homebrew_prefix}/bin/brew shellenv)"

unset homebrew_prefix
