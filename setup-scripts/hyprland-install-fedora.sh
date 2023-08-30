#/bin/bash

sudo dnf copr enable solopasha/hyprland

sudo dnf install -y hyprland hyprland-contrib waybar-hyprland xdg-desktop-portal-hyprland swaybg swaylock rofi-wayland papirus-icon-theme copyq 
sudo dnf remove -y xdg-desktop-portal-wlr # Hyprland only wants wlr or hyprland portal installed.

git clone https://github.com/Murzchnvok/rofi-collection /dev/shm/rofi-themes/
mkdir -p ~/.local/share/rofi/themes
cp -r /dev/shm/rofi-themes/* ~/.local/share/rofi/themes/
find /dev/shm/rofi-themes -name \*.rasi -exec mv {} ~/.local/share/rofi/themes \;
sudo rm -r /dev/shm/rofi-themes

echo "Install GTK Lock through distrobox and copy the binary from /usr/bin to the ~/.local/bin/"
echo "Run rofi-theme-selector to choose your rofi theme"
