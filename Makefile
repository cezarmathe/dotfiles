# Makefile

SHELL = /bin/bash

do:
	cd src && stow --dir=. --target="${HOME}" .
.PHONY: do

undo:
	cd src && stow --dir=. --target="${HOME}" -D .
.PHONY: undo

redo:
	cd src && stow --dir=. --target="${HOME}" -R .
.PHONY: redo
