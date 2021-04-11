# jgarber623's dotfiles

This is how I work.

## Installation

First, launch Terminal and install the Xcode Command Line Tools:

```sh
xcode-select --install
```

Next, clone this repository and run the following commands:

```sh
git clone -b laptop/personal git@github.com:jgarber623/dotfiles ~/.dotfiles

cd ~/.dotfiles

bin/bootstrap
bin/install
```

## Acknowledgments

Significant portions of this work are based on the following projects:

- [Chavez's mac-ansible](https://github.com/mtchavez/mac-ansible)
- [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Ryan Bates' dotfiles](https://github.com/ryanb/dotfiles)
- [Robby Russell's oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

The rest is picked up from various sources online, co-workers, friends, and others. Thanks, everyone!

## License

This code is freely available under the [MIT License](https://opensource.org/licenses/MIT). Use it, learn from it, fork it, improve it, change it, tailor it to your needs.
