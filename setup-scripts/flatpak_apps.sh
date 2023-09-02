#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

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
"com.valvesoftware.Steam"
"flatpak install org.freedesktop.Platform.VulkanLayer.MangoHud"
"com.github.Matoking.protontricks"
"net.lutris.Lutris"
)

for flatpak_app in "${FLATPAK_APPS[@]}"; do
	flatpak -y install flathub $flatpak_app
done

flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam
