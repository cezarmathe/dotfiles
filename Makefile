# Makefile

SHELL = /bin/bash

do:
	cd src && stow -d . -t $$HOME -S .; cd -
.PHONY: do

undo:
	cd src && stow -d . -t $HOME -D .; cd -
.PHONY: undo

redo:
	cd src && stow -d . -t $HOME -R .; cd -
.PHONY: redo
