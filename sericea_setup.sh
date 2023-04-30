#!/bin/bash

rpm-ostree install zsh exa distrobox kitty ranger onedrive
./flatpak_apps.sh
./makesymlinks.sh
