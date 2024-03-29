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
sudo dnf install -y fastfetch yt-dlp zsh ranger btop kitty mogrify lxpolkit mpv java-17-openjdk-devel appimagelauncher onedrive code pipx
# For OS containers 
sudo dnf install -y distrobox podman 
# Neovim Packages
sudo dnf install -y neovim npm gcc lua ripgrep
# Gaming packages
sudo dnf install -y steam lutris wine protontricks mangohud gamescope
# Virtualization Packages
sudo dnf group install -y --with-optional virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
# Japanese Input Packages
sudo dnf install -y fcitx5 fcitx5-configtool fcitx5-mozc mozc adobe-source-han-code-jp-fonts adobe-source-han-sans-jp-fonts adobe-source-han-serif-jp-fonts

# Install tmux package manager (TPM)
mkdir -p ../.config/tmux/plugins/tpm/
git clone https://github.com/tmux-plugins/tpm.git ../.config/tmux/plugins/tpm/

# Install nvchad
 git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

# Install bazzite gaming container
# Info here: https://github.com/ublue-os/bazzite-arch/
distrobox create --nvidia --image ghcr.io/ublue-os/bazzite-arch --name bazzite-arch
distrobox-enter -n bazzite-arch -- '  distrobox-export --app steam'
distrobox-enter -n bazzite-arch -- '  distrobox-export --app lutris'
distrobox-enter -n bazzite-arch -- '  distrobox-export --app protontricks'
distrobox-enter -n bazzite-arch -- '  mkdir -p ~/.steam && distrobox-export --bin /usr/bin/steamcmd --export-path ~/.steam && mv ~/.steam/steamcmd ~/.steam/steamcmd.sh'
distrobox-enter -n bazzite-arch -- '  sudo pacman -S rocm-opencl-runtime rocm-hip-runtime --noconfirm'

# Oh my zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

./flatpak_apps.sh
./hyprland-install-fedora.sh
./fonts.sh

# ../makesymlinks.sh
gsettings set org.gnome.shell.extensions.user-theme name "Tokyonight-Dark-BL-LB"

echo "Add any other drives to /etc/fstab"
echo "Please install onedrive gui from https://github.com/bpozdena/OneDriveGUI"
echo "Run distrobox-enter -n bazzite-arch to finish it's install process"
