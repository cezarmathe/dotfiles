# .bashrc

# default editor
export EDITOR="nvim"

# XDG

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

# Go

export GOPATH="${HOME}/.local/share/go"
export GOBIN="${GOPATH}/bin"
export GOPKG="${GOPATH}/pkg"
export GOSRC="${GOPATH}/src"

# Rust

export CARGO_HOME="${HOME}/.local/share/cargo"
export RUSTUP_HOME="${HOME}/.local/share/rustup"

# path
export PATH="${HOME}/bin:${CARGO_HOME}/bin:${GOBIN}:${PATH}"
