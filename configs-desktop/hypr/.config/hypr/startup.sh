#!/usr/bin/env bash

fcitx5 2>&1 &
nm-applet 2>&1 &
kitty 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run dev.vencord.Vesktop 2>&1 &

sleep 10

"$HOME"/Applications/OneDriveGUI-1.0.3-x86_64_02d8772d37b8b3fabe6f2a9d15740fe1.AppImage 2>&1 &

hyprctl keyword windowrule "workspace unset,kitty"
