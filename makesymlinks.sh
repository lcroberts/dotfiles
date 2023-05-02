#!/bin/bash

files=(
".zshrc"
"Scripts"
".local/share/fonts"
"Pictures/Wallpapers"
".config/i3"
".config/kitty"
".config/nvim"
".local/share/nvim"
".config/polybar"
".config/ranger"
".config/wofi"
".config/sway"
".config/waybar"
)

repo_dir=/home/logan/Projects/dotfiles/
mkdir -p file_backups/.local/share
mkdir -p file_backups/.config
for file in "${files[@]}"; do
  mv "$HOME/"$file "file_backups/"$file
  ln -s -T $repo_dir$file "$HOME/$file"
done

fc-cache
