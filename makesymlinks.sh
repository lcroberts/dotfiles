#!/usr/bin/env bash

symlink() {
    cd "$1" || exit

    for dir in $(ls); do
        stow --target="$HOME" --adopt "$dir"
    done
}

usage() {
    echo "$0 [stow group]"
    echo "Current available stow groups are: general, desktop, laptop"
    echo ""
    echo "To install only a single config you can run the following command in the directory where the config is located:"
    echo "stow --target=\$HOME --adopt [config name]"
}

if [ ! $# -eq 1 ]; then
    usage
    exit 1
fi

case "$1" in
"general")
    symlink ./configs/
    ;;
"desktop")
    symlink ./configs-desktop/
    ;;
"laptop")
    symlink ./configs-laptop/
    ;;
*)
    usage
    exit 1
    ;;
esac
