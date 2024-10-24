#!/usr/bin/env bash
usage() {
    echo "$0 [command] GROUP"
    echo "Here are the available commands:"
    echo "  install"
    echo "  remove"
    echo ""
    echo "Here are the available groups:"
    echo "  latex"
    echo "  laravel"
    echo "  postgres"
    echo "  odin-deps"
}

# Here are some escape sequences for setting text color. Use echo -e for them to work
NC='\033[0m'       # Text Reset
Red='\033[0;31m'   # Red
Green='\033[0;32m' # Green
Blue='\033[0;34m'  # Blue

if [[ -z "$1" ]]; then
    usage
    exit 1
fi
if [[ -z "$2" ]]; then
    usage
    exit 1
fi

case "$1" in
"install") ;;
"remove") ;;
*)
    usage
    exit 1
    ;;
esac

case "$2" in
"latex")
    echo "This program is going to $1 packages for $2"
    sudo dnf $1 zathura zathura-plugins-all texlive-scheme-full latexmk texstudio || exit
    ;;
"laravel")
    case "$1" in
    "install")
        echo "This program is going to $1 packages for $2"
        sudo dnf $1 composer php php-pgsql
        composer global require laravel/installer
        ;;
    "remove")
        echo "This program is going to $1 packages for $2"
        composer global remove laravel/installer
        sudo dnf $1 composer php php-pgsql
        ;;
    esac
    ;;

"postgres")
    echo "This program is going to $1 packages for $2"
    case "$1" in
    "install")
        sudo dnf $1 postgresql-server postgresql-contrib || exit
        sudo systemctl enable postgresql || exit
        sudo postgresql-setup --initdb --unit postgresql || exit
        sudo systemctl start postgresql || exit
        echo -e "$Blue"
        echo "A password can be created for the postgres user by performing the following steps:"
        echo "- Run 'sudo -u postgres psql' to connect to the database"
        echo "- Run the following command in the db connection '\password postgres'"
        echo -e "$NC$Red"
        echo "If you have problems with password authentication then try the following solution. (Make sure you've set a password for the user as well)"
        echo "Edit the file /var/lib/pgsql/data/pg_hba.conf and replace 'host all all 127.0.0.1/32 ident' with 'host all all 127.0.0.1/32 scram-sha-256'"
        echo -e "$NC"
        ;;
    "remove")
        sudo systemctl disable --now postgresql || exit
        sudo dnf $1 postgresql-server postgresql-contrib || exit
        ;;
    esac
    ;;
"odin-deps")
    echo "This program is going to $1 packages for $2"
    sudo dnf $1 llvm17-devel clang || exit
    ;;
*)
    usage
    exit 1
    ;;
esac
