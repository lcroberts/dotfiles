#!/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

FLATPAK_APPS=(
"org.mozilla.firefox"
"com.discordapp.Discord"
"de.shorsh.discord-screenaudio"
"com.spotify.Client"
"com.valvesoftware.Steam"
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
"io.missioncenter.MissionCenter"
"net.ankiweb.Anki"
"org.gnome.Evince"
"com.valvesoftware.Steam"
"org.freedesktop.Platform.VulkanLayer.MangoHud"
"com.valvesoftware.Steam.Utility.gamescope"
"com.valvesoftware.Steam.Utility.protontricks"
"net.lutris.Lutris"
)

for flatpak_app in "${FLATPAK_APPS[@]}"; do
	flatpak -y install flathub $flatpak_app
done

# Enable MangoHud for all steam games
flatpak override --user --env=MANGOHUD=1 com.valvesoftware.Steam
