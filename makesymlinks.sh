#!/bin/bash

files=(
".zshrc"
".screenlayout"
"Scripts"
".local/share/fonts"
"Pictures/RepoImages"
".config/i3"
".config/kitty"
".config/nvim"
".config/polybar"
".config/ranger"
".config/wofi"
".config/sway"
".config/waybar"
".config/kanshi"
".config/MangoHud"
".config/btop"
".config/fastfetch"
".config/tmux"
)

repo_dir=/home/logan/Projects/dotfiles/
mkdir -p file_backups/.local/share
mkdir -p file_backups/.config
for file in "${files[@]}"; do
  if [ -L "$HOME/"$file ]; then
    echo "$file is already symlinked"
    continue
  fi
  mv "$HOME/"$file "file_backups/"$file
  ln -sf -T $repo_dir$file "$HOME/$file"
  echo "Symlink made for $file"
done

if [ ! -L .config/nvim/lua/custom ]; then
  rm -r .config/nvim/lua/custom
  ln -sf -T $repo_dir/nvim_custom $repo_dir/.config/nvim/lua/custom
  echo nvim custom symlink made
fi

fc-cache
