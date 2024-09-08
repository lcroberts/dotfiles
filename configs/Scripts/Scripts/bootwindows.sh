#!/usr/bin/env bash
sudo grub2-reboot "$(sudo grep -i windows /boot/grub2/grub.cfg | cut -d"'" -f2)" && sudo reboot
