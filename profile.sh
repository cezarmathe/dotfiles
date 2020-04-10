#!/usr/bin/env bash

profile="$1"; shift

if [[ -z "${profile}" ]]; then
    printf "%s\n" "You must specify a profile name"
    exit 1
fi

if [[ ! -d "profiles/${profile}" ]]; then
    printf "%s\n" "Profile ${profile} does not exist"
    exit 1
fi

printf "%s\n" "Cleaning active dotfiles directory"
rm -r active
mkdir active

printf "%s\n" "Removing broken symlinks"
./clean.sh

printf "%s\n" "Symlinking new profile"
cd common && stow --dir=. --target=../active .
cd ..
cd "profiles/${profile}" && stow --dir=. --target=../../active .
cd ..
cd ..
cd active && stow --dir=. --target="${HOME}" .
