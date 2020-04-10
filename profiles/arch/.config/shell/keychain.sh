if [[ ! -z $DISPLAY ]] && [[ ! $(tty) = /dev/tty1 ]]; then
    eval $(keychain --agents ssh,gpg -q --eval id_ed25519 ~/.ssh/id_ed25519)

    eval $(keychain --agents ssh,gpg -q --eval 0xA1206DA77DD4DCDC)
fi
