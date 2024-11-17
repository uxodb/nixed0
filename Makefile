.PHONY: sys home update clean

makeRoot:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

nixos:
	sudo nixos-rebuild switch --flake $(makeRoot)

home:
	home-manager switch --impure --flake $(makeRoot)

update:
	sudo nix flake update

clean:
	sudo nix-collect-garbage --delete-old
	sudo /run/current-system/bin/switch-to-configuration boot
