#!/usr/bin/env bash

usage() {
    echo "$0 [command]"
    echo "Available commands are:"
    echo "  dump [filename]          Dumps all installed flatpak applications to a file"
    echo "  install [filename]       Installs all flatpak application listed in a dumped file"
    echo "  uninstall [filename]     Uninstalls all applications listed in a dumped file"
}

if [ -z ${2+x} ]; then
    usage
    exit 1
fi

case "$1" in
"dump")
    echo "Dumping flatpaks to $2..."
    flatpak list --app | awk -F '\t' '{print $2}' >$2
    exit
    ;;
"install")
    echo "Installing flatpaks in $2..."
    flatpak install -- $(cat $2)
    exit
    ;;
"uninstall")
    echo "Uninstalling flatpaks in $2..."
    flatpak uninstall -- $(cat $2)
    exit
    ;;
*)
    usage
    exit 1
    ;;
esac
