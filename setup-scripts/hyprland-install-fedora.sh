#/bin/bash

sudo dnf copr enable solopasha/hyprland

sudo dnf install -y hyprland hyprland-contrib waybar-hyprland xdg-desktop-portal-hyprland swaybg swaylock rofi-wayland
sudo dnf remove -y xdg-desktop-portal-wlr # Hyprland only wants wlr or hyprland portal installed.

echo "Install GTK Lock through distrobox and copy the binary from /usr/bin to the ~/.local/bin/"
