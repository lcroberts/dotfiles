#!/bin/bash

# General Packages
sudo dnf install -y fastfetch yt-dlp zsh
# Gaming Packages
sudo dnf -y install steam lutris winetricks gamemode goverlay mangohud
# Neovim Packages
sudo dnf -y install neovim npm gcc lua ripgrep

# Oh my zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./flatpak_apps.sh
./makesymlinks.sh

ln -s $HOME/Projects/dotfiles/Scripts/setup_monitor.sh $HOME/.local/bin/setup_monitor
ln -s $HOME/Projects/dotfiles/Scripts/reset_monitor.sh $HOME/.local/bin/reset_monitor
