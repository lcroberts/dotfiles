#!/bin/bash

main_display=DP-1
extra_display=DP-3

kitty tmux new -As main 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run org.keepassxc.KeePassXC 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
flatpak run com.spotify.Client 2>&1 &
steam 2>&1 &
$HOME/Applications/OneDriveGUI-1.0.2-x86_64_1b84c900adc54250fd543f66395bd957.AppImage 2>&1 &
