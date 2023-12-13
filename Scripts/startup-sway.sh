#!/bin/bash
kanshi 2>&1 &

main_display=DP-1
extra_display=DP-3

steam 2>&1 &
# discord 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
# spotify 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run org.keepassxc.KeePassXC 2>&1 &
kitty tmux new-session -As main 2>&1 &
pkill waybar; waybar -c "$HOME/.config/waybar.sway/config"

sleep 5
~/Applications/OneDriveGUI-1.0.2-x86_64_1b84c900adc54250fd543f66395bd957.AppImage 2>&1 &
corectrl --minimize-systray 2>&1 &

swaymsg '[workspace=1]' move workspace to output $extra_display
swaymsg '[workspace=2]' move workspace to output $extra_display
swaymsg '[workspace=3]' move workspace to output $extra_display
swaymsg '[workspace=4]' move workspace to output $extra_display
swaymsg '[workspace=5]' move workspace to output $extra_display
swaymsg '[workspace=10]' move workspace to output $main_display

swaymsg reload






