#!/usr/bin/env bash

usage() {
    echo "$0 [command] OPTIONS"
    echo "Available commands are:"
    echo "  dump [filename]          Dumps all installed flatpak applications to a file"
    echo "  install [filename]       Installs all flatpak application listed in a dumped file"
    echo "  uninstall [filename]     Uninstalls all applications listed in a dumped file"
    echo "Available options are:"
    echo "  --user                   Performs operations on user flatpaks"
    echo "  --system                 Performs operations on system flatpaks"
}

# Checks that the second parameter is set
if [[ -z ${2+x} ]]; then
    usage
    exit 1
fi

# Checks if third parameter is set and does checks if it is
if [[ -n ${3+x} ]]; then
    case "$3" in
    "--user")
        echo "Operating on user flatpaks."
        ;;
    "--system")
        echo "Operating on system flatpaks."
        ;;
    *)
        usage
        exit 1
        ;;
    esac
fi

case "$1" in
"dump")
    echo "Dumping flatpaks to $2..."
    flatpak list $3 --app | awk -F '\t' '{print $2}' >$2
    exit
    ;;
"install")
    echo "Installing flatpaks in $2..."
    flatpak install $3 -- $(cat $2)
    exit
    ;;
"uninstall")
    echo "Uninstalling flatpaks in $2..."
    flatpak uninstall $3 -- $(cat $2)
    exit
    ;;
*)
    usage
    exit 1
    ;;
esac
