#!/usr/bin/env bash

# discord 2>&1 &
flatpak run com.discordapp.Discord 2>&1 &
# spotify 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run one.ablaze.floorp 2>&1 &
wezterm start 2>&1 &

sleep 2
swaymsg reload
steam 2>&1 &

sleep 10
~/Applications/OneDriveGUI-1.0.3-x86_64_02d8772d37b8b3fabe6f2a9d15740fe1.AppImage 2>&1 &
