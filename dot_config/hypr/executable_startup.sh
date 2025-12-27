#!/usr/bin/env bash

fcitx5 2>&1 &
nm-applet 2>&1 &
blueman-applet 2>&1 &
kitty 2>&1 &
@filendesktop 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
flatpak run com.spotify.Client 2>&1 &
flatpak run dev.vencord.Vesktop || distrobox-enter aur -- vesktop 2>&1 &

sleep 10

hyprctl keyword windowrule "workspace unset,kitty"
hyprctl keyword windowrule "workspace unset,ghostty"
