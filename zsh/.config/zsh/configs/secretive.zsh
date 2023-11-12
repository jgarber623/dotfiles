#!/usr/bin/env zsh

if [[ $OSTYPE == "darwin"* ]]; then
  secretive_ssh_auth_sock="${HOME}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

  [[ -S "${secretive_ssh_auth_sock}" ]] && export SSH_AUTH_SOCK="${secretive_ssh_auth_sock}"

  unset secretive_ssh_auth_sock
fi
