#!/usr/bin/env fish

# tvcx's fish configuration

set -g QT_QPA_PLATFORM wayland-egl
set -g export CLUTTER_BACKEND wayland
set -g export SDL_VIDEODRIVER wayland
set -g export MOZ_ENABLE_WAYLAND 1
set -g export _JAVA_AWT_WM_NONREPARENTING 1

# alias ls='ls --color=auto'

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

set -g EDITOR "nvim"

set -g GOPATH "$HOME/.local/share/go"
set -g GOBIN "$HOME/.local/share/go/bin"
set -g GOSRC "$HOME/.local/share/go/src"
set -g GOPKG "$HOME/.local/share/go/pkg"

set -g CARGO_HOME "$HOME/.local/share/cargo"

set -g PATH "$HOME/bin" "$GOBIN" "$CARGO_HOME/bin" "$PATH"

if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end
