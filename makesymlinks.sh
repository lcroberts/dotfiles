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
	".config/wezterm"
	".config/starship.toml"
	".config/fish"
	".config/zathura"
	".config/xdg-desktop-portal"
	".local/share/fcitx5"
)

sudo rm -Ir file-backups
mkdir -p file-backups/.local/share/fcitx5
mkdir -p file-backups/.config

for file in "${files[@]}"; do
	if [ -L $file ]; then
		rm $file
	fi
	if [ -d $file ]; then
		mv "$HOME/""$file" "file-backups/""$file"
	fi
	if [ -f $file ]; then
		mv "$HOME/""$file" "file-backups/""$file"
	fi
done

stow . --dotfiles -t "$HOME"/

if [[ ! -L /usr/local/bin/Scripts ]]; then
	sudo ln -sf "$HOME"/Scripts /usr/local/bin/Scripts
fi
