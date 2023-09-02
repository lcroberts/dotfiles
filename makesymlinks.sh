#!/bin/bash

# files=(
# ".zshrc"
# ".zshenv"
# ".screenlayout"
# "Scripts"
# ".local/share/fonts"
# "Pictures/RepoImages"
# ".config/i3"
# ".config/kitty"
# ".config/nvim"
# ".config/polybar"
# ".config/ranger"
# ".config/wofi"
# ".config/sway"
# ".config/waybar"
# ".config/kanshi"
# ".config/MangoHud"
# ".config/btop"
# ".config/fastfetch"
# ".config/tmux"
# ".config/fcitx5"
# ".local/share/fcitx5/themes"
# ".config/hypr"
# )
#
# repo_dir=$HOME/Projects/dotfiles/
# mkdir -p file-backups/.local/share
# mkdir -p file-backups/.config
# mkdir -p file-backups/.local/share/fcitx5
#
# for file in "${files[@]}"; do
#   mv "$HOME/"$file "file-backups/"$file
#   ln -sf -T $repo_dir$file "$HOME/$file"
#   echo "Symlink made for $file"
# done

stow . --dotfiles -t $HOME/

fc-cache
