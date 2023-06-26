#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

FLATPAK_APPS=(
"org.mozilla.firefox"
"com.discordapp.Discord"
"com.spotify.Client"
"com.valvesoftware.Steam"
"net.davidotek.pupgui2"
"md.obsidian.Obsidian"
"com.github.tchx84.Flatseal"
"org.prismlauncher.PrismLauncher"
"org.keepassxc.KeePassXC"
"org.qbittorrent.qBittorrent"
)

for flatpak_app in "${FLATPAK_APPS[@]}"; do
	flatpak -y install flathub $flatpak_app
done

