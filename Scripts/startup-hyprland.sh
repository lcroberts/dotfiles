#!/bin/bash
~/.screenlayout/test.sh 2>&1 &

kitty tmux new -As main 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run org.keepassxc.KeePassXC 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
# discord 2>&1 &
flatpak run com.spotify.Client 2>&1 &
# spotify 2>&1 &
steam 2>&1 &
corectrl --minimize-systray 2>&1 &

sleep 20

$HOME/Applications/OneDriveGUI-1.0.2-x86_64_1b84c900adc54250fd543f66395bd957.AppImage 2>&1 &
# systemctl restart --user xdg-desktop-portal
# systemctl --user start xdg-desktop-portal-gtk.service
hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,firefox"
