#!/usr/bin/env bash

kitty 2>&1 &
flatpak run org.mozilla.firefox 2>&1 &
sleep 10
$HOME/AppImages/OneDriveGUI-1.0.3-x86_64.AppImage 2>&1 &
