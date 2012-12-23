# jgarber623's Dotfiles #

This is how I work.

## Requirements ##

1. [ruby](http://www.ruby-lang.org/) (1.9.3 or higher)
2. [rake](http://rake.rubyforge.org/) (0.9.2.2 or higher)

## Installation ##

	git clone git://github.com/jgarber623/dotfiles.git ~/.dotfiles
	cd ~/.dotfiles
	rake install

The installation rake task will create symlinks in `~/` that point to the appropriate files in `~/.dotfiles`.

## Features ##

## Uninstall ##

To remove the symlinks created during installation, simply run the following rake task:

	rake uninstall

## Credit, Where Due ##

Significant portions of this work are based on [Ryan Bates' dotfiles](https://github.com/ryanb/dotfiles), [Robby Russell's oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), and [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles). The rest is picked up from various sources online, co-workers, friends, and others. Thanks, everyone!