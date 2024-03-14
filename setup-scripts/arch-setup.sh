#!/usr/bin/env bash
# This is a script to automate a lot of the tedious post install stuff for Arch Linux
# It should be ran after disks are partitioned, you are chrooted, the fstab has been generated,
# and the bootloader has been installed. The script will set locale, enable ntp, set the hostname
# rank pacman mirrors, enable parallel downloads, install the paru aur helper, and install
# and set up some packages, for audio, virtualization and other things.
# It is recommended to set up the chaotic aur ahead of running the script.

# Set up time and ntp
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
echo "NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org" | sudo tee -a /etc/systemd/timesyncd.conf
echo "FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 0.fr.pool.ntp.org" | sudo tee -a /etc/systemd/timesyncd.conf
sudo systemctl enable --now systemd-timesyncd.service
sudo timedatectl set-ntp true

# Set up locale information
sudo sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf
sudo locale-gen

# Set hostname
echo "notascam" | sudo tee /etc/hostname

# Enable multilib
echo "[multilib]" | sudo tee -a /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu --noconfirm

# Ranking mirrors
echo "Ranking mirrors"
sudo pacman -S --noconfirm reflector
sudo reflector --latest 150 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syu --noconfirm
# Enable parallel downloads
echo "Enabling parallel downloads"
sudo sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 12/g'

# Install paru
echo "Installing git"
sudo pacman -S --noconfirm git
if [ ! -f /sbin/paru ]; then
	echo "Installing paru"
	sudo pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -r paru
	paru -Syu --noconfirm
else
	echo "paru found"
fi

PACKAGES=(
	# Audio
	"pipewire-audio"
	"pipewire-alsa"
	"pipewire-pulse"
	"pipewire-jack"
	# Networking
	"networkmanager"
	"network-manager-applet"
	# Virtualization
	"libvirt"
	"swtpm"
	"iptables-dft"
	"dnsmasq"
	"virt-manager"
	"virtio-win"
	# Japanese Input
	"adobe-source-han-sans-jp-fonts"
	"adobe-source-han-serif-jp-fonts"
	"fcitx5"
	"fcitx5-configtool"
	"fcitx5-gtk"
	"fcitx5-mozc"
	"fcitx5-qt"
	# Applications
	"flatpak"
	"fish"
	"onedrive-abraunegg-git"
	"onedrivegui-git"
	"dolphin"
	"okular"
	"obsidian"
	"floorp"
	"keepassxc"
	"filelight"
	"kitty"
	"imv"
	"mpv"
	"libreoffice-still"
	"anki-bin" # TODO: Verify package name
	"vesktop"  # TODO: Verify package name
	"drawio"   # TODO: Verify package name
	# DE and Window Managers
	"sddm"
	"plasma-meta"
	"sddm-kcm"
	"hyprland-git"
	"xdg-desktop-portal-hyprland-git"
	"xdg-desktop-portal-gtk"
	"waybar"
	"swaylock-effects-git"
	"swayidle"
	"swaybg"
	"grimshot"
	"wl-clipboard"
	"brightnessctl"
	"playerctl"
	"rofi-lbonn-wayland-git"
	"kanshi"
	"xwaylandvideobridge"
	# Theming
	"qt5ct"
	"qt6ct"
	"gnome-themes-extra"
	"gtk-engine-murrine"
	# Neovim and development packages
	"luajit"
	"neovim"
	"go"
	"npm"
	"lldb"
	"make"
	"ripgrep"
	"rustup"
	"valgrind"
	"gdb"
)

install() {
	# First lets see if the package is there
	if paru -Q $1 &>>/dev/null; then
		echo -e "$1 is already installed."
	else
		# no package found so installing
		echo -e "Now installing $1 ..."
		yay -S --noconfirm $1
		# test to make sure package installed
		if paru -Q $1 &>>/dev/null; then
			echo -e "$1 was installed."
		else
			# if this is hit then a package is missing
			echo -e "$1 install failed"
			exit
		fi
	fi
}

for PKG in "${PACKAGES[@]}"; do
	install "$PKG"
done

sudo systemctl enable --now NetworkManager.service
sudo systemctl enable sddm.service

echo "Install your CPU microcode package and run 'grub-mkconfig -o /boot/grub/grub.cfg'"
echo "It also doesn't hurt to run 'mkinitcpio -P' to ensure there are not problems with the initramfs"
echo "Use passwd to set a root password and make a user as well"
