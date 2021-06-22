#!/usr/bin/env bash

function symlinks() {
    local dir; dir="$1"; shift
    local args; args=$@

    local wd; wd="$(pwd)"

    cd $dir; stow --dir . --target="${HOME}" ${args} .; cd "${wd}"
}

function main() {
    local srcdir; srcdir="$1"; shift
    local args; op=$@

    local user; user="$(whoami)"
    local host; host="$(uname -n)"

    if [[ -d "${srcdir}/@" ]]; then
        printf "%s\n" "Symlinking common dotfiles."
        symlinks "${srcdir}/@" ${args}
    fi

    if [[ -d "${srcdir}/@${host}" ]]; then
        printf "%s\n" "Symlinking @${host} dotfiles."
        symlinks "${srcdir}/@${host}" $args
    fi

    if [[ -d "${srcdir}/${user}@${host}" ]]; then
        printf "%s\n" "Symlinking ${user}@${host} dotfiles."
        symlinks "${srcdir}/${user}@${host}" $args
    fi
}

main $@
