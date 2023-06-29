#!/bin/bash

sudo dnf install fastfetch steam lutris winetricks yt-dlp gamemode goverlay mangohud

./flatpak_apps.sh
./makesymlinks.sh

ln -s $HOME/Projects/dotfiles/Scripts/setup_monitor.sh $HOME/.local/bin/setup_monitor
ln -s $HOME/Projects/dotfiles/Scripts/reset_monitor.sh $HOME/.local/bin/reset_monitor
