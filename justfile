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

dev-install-nix:
    distrobox-enter dev -- bash -c "sh <(curl -L https://nixos.org/nix/install) --daemon"

dev-remove-nix:
    #!/usr/bin/env bash
    distrobox-enter dev -- bash -c "sudo systemctl stop nix-daemon.service"
    distrobox-enter dev -- bash -c "sudo systemctl disable nix-daemon.socket nix-daemon.service"
    distrobox-enter dev -- bash -c "sudo systemctl daemon-reload"
    distrobox-enter dev -- bash -c "sudo rm -rf /etc/nix /etc/profile.d/nix.sh /etc/tmpfiles.d/nix-daemon.conf /nix ~root/.nix-channels ~root/.nix-defexpr ~root/.nix-profile"
    for i in $(seq 1 32); do
        distrobox-enter dev -- bash -c "sudo userdel nixbld$i"
    done
    distrobox-enter dev -- bash -c "sudo groupdel nixbld"
