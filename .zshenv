# Japanese Input
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# Path Additions
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/logan/.local/bin:/home/logan/Scripts:$PATH
export PATH=$PATH:/opt/gradle/gradle-8.2.1/bin
export PATH=$HOME/.cargo/bin:$PATH

. "$HOME/.cargo/env"

if [ -e /home/logan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/logan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
