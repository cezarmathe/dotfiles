#!/usr/bin/env fish

# tvcx's fish configuration

# function reload() {
#     local shell
#     shell="${SHELL}"
#     if [[ "${shell}" == "/usr/bin/zsh" ]]; then
#         source ~/.zshrc
#         return
#     fi
#     if [[ "${shell}" == "/usr/bin/bash" ]]; then
#         source ~/.bashrc
#         return
#     fi
#     printf "%s\n" "Unknown shell"
# }

# function git_additions_deletions() {
#     local username="$1"; shift
#     local branch="$1"; shift
#     git log --author=${username} --shortstat ${branch} | \
#         awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
#         END { printf("%d files changed, %d insertions(+), %d deletions(-)\n", f, i, d) }'
# }

# function targz() {
#   local filename
#   filename="$1"

#   tar -cjf "${filename}.tar.gz" "${filename}"
# }

# default editor
set -g EDITOR "vim"

# XDG

set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"

# Go

set -gx GOPATH "$HOME/.local/share/go"
set -gx GOBIN "$GOPATH/bin"
set -gx GOSRC "$GOPATH/src"
set -gx GOPKG "$GOPATH/pkg"

# Rust

set -gx CARGO_HOME "$HOME/.local/share/cargo"
set -gx RUSTUP_HOME "$HOME/.local/share/rustup"

# path
set -gx PATH "$HOME/.local/bin" "$GOBIN" "$CARGO_HOME/bin" "$PATH"

if test -z $DISPLAY; and test (tty) = "/dev/tty1"
    exec sway
end

alias bazel bazelisk
