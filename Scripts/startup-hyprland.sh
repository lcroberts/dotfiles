#!/usr/bin/env bash
~/.screenlayout/test.sh 2>&1 &

kitty tmux new -As main 2>&1 &
floorp 2>&1 &
# flatpak run com.discordapp.Discord 2>&1 &
vesktop 2>&1 &
flatpak run com.spotify.Client 2>&1 &
steam 2>&1 &

sleep 5

corectrl --minimize-systray 2>&1 &
onedrivegui 2>&1 &

sleep 20

hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,firefox"
hyprctl keyword windowrule "workspace unset,floorp"
