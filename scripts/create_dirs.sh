#!/usr/bin/env bash

# scripts/create_dirs.sh
# 
# Creates all directories used by my dotfiles.

find src -type d ! -name src | cut -d '/' -f 2- | xargs -I {} mkdir -p ${HOME}/{}

