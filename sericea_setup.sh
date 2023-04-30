#!/bin/bash

rpm-ostree install zsh exa distrobox kitty ranger
./flatpak_apps.sh
./makesymlinks.sh
