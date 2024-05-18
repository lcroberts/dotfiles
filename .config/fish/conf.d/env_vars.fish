fish_add_path $HOME/Scripts
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
set -gx GOPATH $HOME/.local/share/go
fish_add_path $GOPATH/bin

set -gx MANGOHUD 1

set -gx GTK_IM_MODULE 'fcitx'
set -gx QT_IM_MODULE 'fcitx'
set -gx SDL_IM_MODULE 'fcitx'
set -gx XMODIFIERS '@im=fcitx'

set -gx VISUAL "nvim"
set -gx EDITOR "nvim"

set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin
