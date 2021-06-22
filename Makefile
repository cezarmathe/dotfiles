# Makefile

SHELL = /bin/bash

do:
	./scripts/symlinks.sh src
.PHONY: do

undo:
	./scripts/symlinks.sh src -D
.PHONY: undo

redo:
	./scripts/symlinks.sh src -R
.PHONY: redo
