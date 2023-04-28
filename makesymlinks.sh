#!/bin/bash

files=(
".zshrc"
"Scripts"
".local/share/fonts"
".config/i3"
".config/kitty"
".config/nvim"
".config/polybar"
".config/ranger"
".config/wofi"
)

repo_dir=/home/logan/GitClones/dotfiles/
mkdir file_backups
for file in "${files[@]}"; do
  mv "/home/$USER/"$file file_backups
  ln -s $repo_dir$file "/home/$USER/$file"
done

fc-cache
