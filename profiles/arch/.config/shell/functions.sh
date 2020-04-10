function reload() {
    local shell
    shell="${SHELL}"
    if [[ "${shell}" == "/usr/bin/zsh" ]]; then
        source ~/.zshrc
        return
    fi
    if [[ "${shell}" == "/usr/bin/bash" ]]; then
        source ~/.bashrc
        return
    fi
    printf "%s\n" "Unknown shell"
}
