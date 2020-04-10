#!/usr/bin/env bash

DIRS=("${HOME}" "${HOME}/.config")

for dir in ${DIRS[*]}; do
    printf "%s\n" "Cleaning ${dir}"
    for symlink in $(find -P ${dir} -maxdepth 1 -xtype l); do
        printf "%s\n" "Removing ${symlink}"
        rm "${symlink}"
    done
done
