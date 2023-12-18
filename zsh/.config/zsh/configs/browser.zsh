#!/usr/bin/env zsh

# On Debian/Ubuntu systems, the `open` command is part of the xdg-utils pakcage
# and can be installed by running:
#
#   apt update && apt install --yes xdg-utils
#
export BROWSER="${BROWSER:-open}"
