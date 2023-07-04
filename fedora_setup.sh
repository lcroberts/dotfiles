#!/bin/bash

# Speed up dnf
sudo echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf

# Enable RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Flatpak Setup
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Add vscode repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update

# Multimedia Libraries
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# General Packages
sudo dnf install -y fastfetch yt-dlp zsh ranger btop kitty mogrify lxpolkit mpv java-17-openjdk-devel appimagelauncher onedrive code
# Gaming Packages
sudo dnf -y install steam lutris winetricks gamemode goverlay mangohud
# Neovim Packages
sudo dnf -y install neovim npm gcc lua ripgrep
# Virtualization Packages
sudo dnf group install -y --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd

# Symlink monitor scripts
mkdir -p $HOME/.local/bin/
ln -s $HOME/Projects/dotfiles/Scripts/setup_monitor.sh $HOME/.local/bin/setup_monitor
ln -s $HOME/Projects/dotfiles/Scripts/reset_monitor.sh $HOME/.local/bin/reset_monitor

# Oh my zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./flatpak_apps.sh
./makesymlinks.sh

echo "Please install onedrive gui from https://github.com/bpozdena/OneDriveGUI"
echo "Add any other drives to /etc/fstab"
