SOURCE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

all: install

install:
	stow --verbose --dir=$(SOURCE_DIR) --target=$(HOME) --restow */

uninstall:
	stow --verbose --dir=$(SOURCE_DIR) --target=$(HOME) --delete */
