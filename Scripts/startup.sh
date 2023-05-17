#!/bin/bash
kanshi &

right_display=DP-1
left_display=DP-3

steam 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run org.keepassxc.KeePassXC 2>&1 &
kitty 2>&1 &
$HOME/Applications/OneDriveGUI-1.0.2-x86_64_1b84c900adc54250fd543f66395bd957.AppImage 2>&1 &

sleep 5
mullvad 2>&1 &
swaymsg '[workspace=1]' move workspace to output $right_display
swaymsg '[workspace=2]' move workspace to output $left_display
swaymsg '[workspace=3]' move workspace to output $right_display
swaymsg '[workspace=4]' move workspace to output $right_display
swaymsg '[workspace=10]' move workspace to output $left_display
