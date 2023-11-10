# jgarber623's dotfiles

[![Build](https://img.shields.io/github/actions/workflow/status/jgarber623/dotfiles/ci.yml?branch=main&logo=github&style=for-the-badge)](https://github.com/jgarber623/dotfiles/actions/workflows/ci.yml)

## Prerequisites

- macOS (Ventura 13.x or newer)
- [Homebrew](https://brew.sh) – macOS package manager
- [Antidote](https://getantidote.github.io) – Zsh plugin manager

## Usage

```sh
# Install GNU Stow (https://www.gnu.org/software/stow/)
brew install stow

# Clone this repository
git clone https://github.com/jgarber623/dotfiles ~/.dotfiles

cd ~/.dotfiles

# Install symlinks for all packages using GNU Stow
make install

# Remove symlinks for all packages using GNU Stow
make uninstall
```

### Local configuration files

Use `*.local` files to store secrets:

```sh
# See `man 1 git-config` for details on this configuration option.
cat <<EOF >> git/.gitconfig.local
[user]
  signingKey = <file_path_or_key_identifier>
EOF

# See `man 1 ssh-keygen` for details on this file's formatting.
cat <<EOF >> ssh/.ssh/allowed_signers.local
<email_address> <keytype> <key>
EOF

# A GitHub Personal Access Token with repo scope.
echo 'export HOMEBREW_GITHUB_API_TOKEN="<github_api_token>"' >> zsh/.zprofile.local
```

Re-run `make install` after creating these files.

## License

This code is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
