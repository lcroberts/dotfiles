SHELL=/usr/bin/env bash

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

clean:
	find $$HOME/.config/ -maxdepth 1 -type l -exec rm {} \;
	[ ! -L "$$HOME/.npmrc" ] || rm "$$HOME/.npmrc"
	[ ! -L "$$HOME/.ideavimrc" ] || rm "$$HOME/.ideavimrc"
	[ ! -L "$$HOME/.clang-format" ] || rm "$$HOME/.clang-format"
	[ ! -L "$$HOME/.screenlayout" ] || rm "$$HOME/.screenlayout"
	[ ! -L "$$HOME/Scripts" ] || rm "$$HOME/Scripts"

nix-install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

nix-remove:
	/nix/nix-installer uninstall
