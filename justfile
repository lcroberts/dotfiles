default:
  @just --list

symlink-general:
    #!/usr/bin/env bash
    git update-index --assume-unchanged configs/firefox/.mozilla/firefox/a7vjcx1o.logan/times.json
    cd ./configs/
    for dir in $(ls); 
    	do stow --target="$HOME" --adopt "$dir";
    done

symlink-desktop:
    #!/usr/bin/env bash
    cd ./configs-desktop/ || exit
    for dir in $(ls); do 
        stow --target="$HOME" --adopt "$dir" 
    done

symlink-laptop:
    #!/usr/bin/env bash
    cd ./configs-laptop/ || exit
    for dir in $(ls); do 
        stow --target="$HOME" --adopt "$dir"
    done

remove-symlinks:
    #!/usr/bin/env bash
    find ~/.config/ -maxdepth 1 -type l -exec rm {} \;
    rm ~/.npmrc || echo ".npmrc not present"
    rm ~/.ideavimrc || echo ".ideavimrc not present"
    rm ~/.clang-format || echo ".clang-format not present"
    rm ~/.screenlayout || echo ".screenlayout not present"
    rm ~/Scripts || echo "Scripts not present"

nix-install:
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

nix-remove:
    /nix/nix-installer uninstall
