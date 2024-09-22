SHELL=/usr/bin/env bash
.PHONY: clean clean-nix desktop laptop symlink-general symlink-desktop symlink-laptop

symlink-general:
	cd ./configs/; for dir in $$(ls); do \
		stow --target="$$HOME" --adopt "$$dir"; \
	done

symlink-desktop:
	cd ./configs-desktop/; for dir in $$(ls); do \
		stow --target="$$HOME" --adopt "$$dir"; \
	done

symlink-laptop:
	cd ./configs-laptop/; for dir in $$(ls); do \
		stow --target="$$HOME" --adopt "$$dir"; \
	done

desktop: symlink-general symlink-desktop
laptop: symlink-general symlink-laptop

clean:
	find $$HOME/.config/ -maxdepth 1 -type l -exec rm {} \;
	[ ! -L "$$HOME/.npmrc" ] || rm "$$HOME/.npmrc"
	[ ! -L "$$HOME/.ideavimrc" ] || rm "$$HOME/.ideavimrc"
	[ ! -L "$$HOME/.clang-format" ] || rm "$$HOME/.clang-format"
	[ ! -L "$$HOME/.screenlayout" ] || rm "$$HOME/.screenlayout"
	[ ! -L "$$HOME/Scripts" ] || rm "$$HOME/Scripts"

nix:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

clean-nix:
	/nix/nix-installer uninstall

gaming-distrobox:
	distrobox-create --unshare-netns --nvidia --image ghcr.io/ublue-os/bazzite-arch --name bazzite-arch -Y
	distrobox-enter -n bazzite-arch --  bash -c "distrobox-export --app steam"
	distrobox-enter -n bazzite-arch --  bash -c "distrobox-export --app lutris"
	distrobox-enter -n bazzite-arch --  bash -c "distrobox-export --app protontricks"
	distrobox-enter -n bazzite-arch --  bash -c "mkdir -p ~/.steam && distrobox-export --bin /usr/bin/steamcmd --export-path ~/.steam && mv ~/.steam/steamcmd ~/.steam/steamcmd.sh"
	distrobox-enter -n bazzite-arch -- bash -c "echo 'distrobox-host-exec distrobox-enter \$@' | sudo tee /usr/bin/distrobox-enter && sudo chmod +x /usr/bin/distrobox-enter"
	distrobox-enter -n bazzite-arch -- bash -c "echo 'distrobox-host-exec x-terminal-emulator \$@' | sudo tee /usr/bin/x-terminal-emulator && sudo chmod +x /usr/bin/x-terminal-emulator"
