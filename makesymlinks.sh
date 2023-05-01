#!/bin/bash

files=(
".zshrc"
"Scripts"
".local/share/fonts"
"Pictures/Wallpapers"
".config/i3"
".config/kitty"
".config/nvim"
".config/polybar"
".config/ranger"
".config/wofi"
".config/sway"
".config/waybar"
)

repo_dir=/home/logan/Projects/dotfiles/
mkdir file_backups
for file in "${files[@]}"; do
  mv "/home/$USER/"$file file_backups
  ln -sf $repo_dir$file "/home/$USER/$file"
done

fc-cache
