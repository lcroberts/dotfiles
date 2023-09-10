#!/bin/bash

# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
flatpak override --user --filesystem=xdg-config/gtk-4.0
sudo flatpak override --filesystem=xdg-config/gtk-4.0

sudo flatpak override --env=GTK_THEME=my-theme 
sudo flatpak override --env=ICON_THEME=Tokyonight-Dark

FLATPAK_APPS=(
"org.mozilla.firefox"
"com.discordapp.Discord"
"de.shorsh.discord-screenaudio"
"com.spotify.Client"
"net.davidotek.pupgui2"
"md.obsidian.Obsidian"
"com.github.tchx84.Flatseal"
"org.prismlauncher.PrismLauncher"
"org.keepassxc.KeePassXC"
"org.qbittorrent.qBittorrent"
"com.github.micahflee.torbrowser-launcher"
"com.github.alexkdeveloper.desktop-files-creator"
"com.github.qarmin.czkawka"
"com.github.mtkennerly.ludusavi"
"net.ankiweb.Anki"
"org.gnome.Evince"
)

for flatpak_app in "${FLATPAK_APPS[@]}"; do
	flatpak -y install flathub $flatpak_app
done
