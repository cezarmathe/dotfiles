function reload() {
    local shell
    shell="${SHELL}"
    if [[ "${shell}" == "/bin/zsh" ]]; then
        source ~/.zshrc
        return
    fi
    if [[ "${shell}" == "/bin/bash" ]]; then
        source ~/.bashrc
        return
    fi
    printf "%s\n" "Unknown shell"
}
