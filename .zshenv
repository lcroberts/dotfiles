export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

. "$HOME/.cargo/env"
export PATH=$PATH:/opt/gradle/gradle-8.2.1/bin

if [ -e /home/logan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/logan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
