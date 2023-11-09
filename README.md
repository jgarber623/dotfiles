# jgarber623's dotfiles

[![Build](https://img.shields.io/github/actions/workflow/status/jgarber623/dotfiles/ci.yml?branch=main&logo=github&style=for-the-badge)](https://github.com/jgarber623/dotfiles/actions/workflows/ci.yml)

## Prerequisites

- macOS (Ventura 13.x or newer)
- [Homebrew](https://brew.sh) – macOS package manager
- [Antidote](https://getantidote.github.io) – Zsh plugin manager
- [Starship](https://starship.rs) – cross-shell prompt
- [rbenv](https://github.com/rbenv/rbenv) – Ruby version manager

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
cat <<EOF >> git/.gitconfig.local
[user]
  signingKey = …
EOF

echo 'export HOMEBREW_GITHUB_API_TOKEN="…"' >> zsh/.zprofile.local
```

Re-run `make install` after creating these files.

## License

This code is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
