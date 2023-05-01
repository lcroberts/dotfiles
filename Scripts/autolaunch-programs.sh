#!/usr/bin/bash

/usr/bin/steam 2>&1 &
/home/logan/Applications/OneDriveGUI-1.0.2-x86_64_1b84c900adc54250fd543f66395bd957.AppImage &
/usr/bin/kitty 2>&1 &
/usr/bin/firefox 2>&1 &
/usr/bin/keepassxc 2>&1 &
# obsidian 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
flatpak run com.spotify.Client 2>&1 &

right_display="DP-4"
left_display="DP-2"
sleep 5
i3-msg '[workspace="1"]' move workspace to output $right_display 
i3-msg '[workspace="2"]' move workspace to output $left_display
i3-msg '[workspace="3"]' move workspace to output $right_display
i3-msg '[workspace="4"]' move workspace to output $right_display
i3-msg '[workspace="10"]' move workspace to output $left_display
$HOME/.config/polybar/launch.sh 2>&1 &
