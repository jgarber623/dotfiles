#!/usr/bin/env zsh

export DOTFILES="$(cd -- "${${(%):-%x}:A:h}/../../../.." > /dev/null 2>&1 && pwd)"
