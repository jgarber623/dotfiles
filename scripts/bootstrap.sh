#!/usr/bin/env bash

if [[ ! `which pip` ]]; then
  echo '=> Installing pip...'
  sudo easy_install pip
else
  echo '✓ pip already installed.'
fi

if [[ ! `which ansible` ]]; then
  echo '=> Installing Ansible...'
  sudo -H pip install ansible
else
  echo '✓ Ansible already installed.'
fi

if [[ ! `which brew` ]]; then
  echo '=> Installing Homebrew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo '✓ Homebrew already installed.'
fi

echo '=> Bootstrap script finished.'
