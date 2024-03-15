#!/usr/bin/env bash
# This is a script to automate a lot of the tedious post install stuff for Arch Linux
# It should be ran after disks are partitioned, you are chrooted, the fstab has been generated,
# and the bootloader has been installed. The script will set locale, enable ntp, set the hostname
# rank pacman mirrors, enable parallel downloads, install the paru aur helper, and install
# and set up some packages, for audio, virtualization and other things.
# It is recommended to set up the chaotic aur ahead of running the script.

# Set up time and ntp
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
echo "NTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org" >>/etc/systemd/timesyncd.conf
echo "FallbackNTP=0.pool.ntp.org 1.pool.ntp.org 0.fr.pool.ntp.org" >>/etc/systemd/timesyncd.conf
systemctl enable --now systemd-timesyncd.service
timedatectl set-ntp true

# Set up locale information
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
echo "LANG=en_US.UTF-8" >>/etc/locale.conf
locale-gen

# Set hostname
echo "notascam" >/etc/hostname

# Enable parallel downloads
echo "Enabling parallel downloads"
sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 5/g'
sed -i 's/ParallelDownloads = 5/ParallelDownloads = 10/g'

# Ranking mirrors
echo "Ranking mirrors"
pacman -S --noconfirm reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 50 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syu --noconfirm

# Install paru
echo "Installing git"
pacman -S --noconfirm git
if [ ! -f /sbin/paru ]; then
	echo "Installing paru"
	pacman -S --needed base-devel
	git clone https://aur.archlinux.org/paru.git
	cd paru || exit
	makepkg -si || exit
	cd ..
	rm -r paru
	paru -Syu --noconfirm
else
	echo "paru found"
fi

PACKAGES=(
	# Misc System Stuff
	"sudo"
	"polkit"
	"polkit-gnome"
	"mkinitcpio-firmware"
	"ast-firmware"
	"sof-firmware"
	# Audio
	"pipewire-audio"
	"pipewire-alsa"
	"pipewire-pulse"
	"pipewire-jack"
	# Networking
	"networkmanager"
	"network-manager-applet"
	# Virtualization
	"qemu-full"
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
	"floorp-bin"
	"keepassxc"
	"filelight"
	"kitty"
	"imv"
	"mpv"
	"libreoffice-still"
	"anki-bin"
	"vesktop-bin"
	"drawio-desktop-bin"
	"autojump"
	"bat"
	"btop"
	"direnv"
	"docker"
	"distrobox"
	"eza"
	"ffmpeg"
	"fwupd"
	"fzf"
	"jdk-openjdk"
	"p7zip"
	"parallel"
	"paru-bin"
	"pavucontrol"
	"pigz"
	"starship"
	"stow"
	"tmux"
	"vim"
	"yt-dlp"
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
	"noto-fonts-emoji"
	# Neovim and development packages
	"luajit"
	"neovim-nightly-bin"
	"go"
	"npm"
	"lldb"
	"make"
	"ripgrep"
	"rustup"
	"valgrind"
	"gdb"
	"man-pages"
	"man-db"
)

install() {
	# First lets see if the package is there
	if paru -Q "$1" &>>/dev/null; then
		echo -e "$1 is already installed."
	else
		# no package found so installing
		echo -e "Now installing $1 ..."
		yay -S --noconfirm "$1"
		# test to make sure package installed
		if paru -Q "$1" &>>/dev/null; then
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

systemctl enable --now NetworkManager.service
systemctl enable sddm.service

echo "Install your CPU microcode package and run 'grub-mkconfig -o /boot/grub/grub.cfg'"
echo "It also doesn't hurt to run 'mkinitcpio -P' to ensure there are not problems with the initramfs"
echo "Use passwd to set a root password and make a user as well"
echo "Useradd Template: 'useradd -G wheel docker libvirt -s /bin/fish -m logan'"
