#!/usr/bin/env bash

fcitx5 2>&1 &
nm-applet 2>&1 &
blueman-applet 2>&1 &
ghostty 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run dev.vencord.Vesktop 2>&1 &

sleep 10

# find $HOME/Applications/ -iname "onedrive*.appimage" -exec {} \;

hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,ghostty"
