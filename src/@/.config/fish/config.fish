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
# 	local filename
# 	filename="$1"

# 	tar -cjf "${filename}.tar.gz" "${filename}"
# }

# default editor
set -g EDITOR "nvim"

# XDG

set -g XDG_DATA_HOME "$HOME/.local/share"
set -g XDG_CONFIG_HOME "$HOME/.config"
set -g XDG_CACHE_HOME "$HOME/.cache"

# Go

set -g GOPATH "$HOME/.local/share/go"
set -g GOBIN "$HOME/.local/share/go/bin"
set -g GOSRC "$HOME/.local/share/go/src"
set -g GOPKG "$HOME/.local/share/go/pkg"

# Rust

set -g CARGO_HOME "$HOME/.local/share/cargo"
set -g RUSTUP_HOME "$HOME/.local/share/rustup"

# path
set -g PATH "$HOME/bin" "$GOBIN" "$CARGO_HOME/bin" "$PATH"
