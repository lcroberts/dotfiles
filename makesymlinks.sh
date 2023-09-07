#!/bin/bash

files=(
".zshrc"
".zshenv"
".screenlayout"
"Scripts"
".config/btop"
".config/fastfetch"
".config/fcitx5"
".config/hypr"
".config/i3"
".config/kanshi"
".config/kitty"
".config/MangoHud"
".config/nvim/lua/custom"
".config/polybar"
".config/ranger"
".config/rofi"
".config/sway"
".config/tmux"
".config/waybar"
".config/wofi"
".local/share/fcitx5/themes"
)

sudo rm -Ir file-backups
mkdir -p file-backups/.local/share/fcitx5
mkdir -p file-backups/.config/nvim/lua/

for file in "${files[@]}"; do
  mv "$HOME/"$file "file-backups/"$file
done

stow . --dotfiles -t $HOME/

sudo ln -sf $HOME/Scripts /usr/local/bin/Scripts
