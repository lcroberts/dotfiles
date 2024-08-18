#!/usr/bin/env bash
if [[ "$1" == "install" ]]; then
    sudo dnf install zathura zathura-plugins-all texlive-scheme-basic latexmk texstudio
elif [[ "$1" == "uninstall" ]]; then
    sudo dnf remove zathura zathura-plugins-all texlive-scheme-basic latexmk texstudio
else
    echo "Invalid command please use $0 install/uninstall"
fi
