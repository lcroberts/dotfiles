#!/bin/bash

files=(
	".zshrc"
	".zshenv"
	"Scripts"
	".config/fastfetch"
	".config/fcitx5"
	".config/MangoHud"
	".config/polybar"
	".config/rofi"
	".config/sway"
	".config/tmux"
	".config/waybar"
	".config/wofi"
	".config/qt5ct"
	".config/qt6ct"
	".config/starship.toml"
	".config/fish"
	".config/xdg-desktop-portal"
	".local/share/fcitx5/themes"
)

sudo rm -Ir file-backups
mkdir -p file-backups/.local/share/fcitx5

for file in "${files[@]}"; do
	mv "$HOME/""$file" "file-backups/""$file"
done

stow . --dotfiles -t "$HOME"/

sudo ln -sf "$HOME"/Scripts /usr/local/bin/Scripts
