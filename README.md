# jgarber623's dotfiles

This is how I work.

## Installation

First, install Xcode command line tools:

```sh
xcode-select --install
```

Then, clone this repository and run the installation command:

```sh
git clone git@github.com:jgarber623/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout macbook-pro
rake
```

The available installation tasks will install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), install [Homebrew](http://brew.sh/), and create symlinks in `~` that point to the appropriate system configuration files in `~/.dotfiles`.

After successfully installing dotfiles, you may also run `rake homebrew:bundle` to install additional software as defined in `Brewfile`.

A typical installation process might look like:

```sh
rake oh_my_zsh                # rake oh_my_zsh:install
rake oh_my_zsh:install_theme
rake homebrew                 # rake homebrew:install
rake homebrew:bundle
rake dotfiles                 # rake dotfiles:install
rake ruby                     # rake ruby:install
rake ruby:install_gems
rake node                     # rake node:install_packages
```

## Acknowledgments

Significant portions of this work are based on [Ryan Bates' dotfiles](https://github.com/ryanb/dotfiles), [Robby Russell's oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), and [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles). The rest is picked up from various sources online, co-workers, friends, and others. Thanks, everyone!

## License

This code is freely available under the [MIT License](http://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
