#!/usr/bin/env bash

# This script copies the theme files and config file and places them in proper folder
_theme="$HOME/.local/share/rofi/themes"

if [[ ! -d "$_theme" ]]; then
	mkdir -p "$_theme"
fi

cp -r "$PWD"/.local/share/rofi/themes/* "$_theme"
