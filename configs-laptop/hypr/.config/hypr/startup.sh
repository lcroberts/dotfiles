#!/usr/bin/env bash

kitty 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
sleep 10
$HOME/AppImages/onedrivegui.appimage 2>&1 &

hyprctl keyword windowrule "workspace unset,kitty"
