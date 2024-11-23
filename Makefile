.PHONY: nixos home update clean whatif test rollback

makeRoot:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

nixos:
	sudo nixos-rebuild switch --flake .#nixed0

home:
	home-manager switch --impure --flake .#uxodb@nixed0

update:
	sudo nix flake update

whatif: 
	sudo nixos-rebuild dry-activate --flake .#nixed0

test:
	sudo nixos-rebuild test --flake .#nixed0

rollback:
	sudo nixos--rebuild --rollback switch

clean:
	sudo nix-collect-garbage --delete-old
	sudo /run/current-system/bin/switch-to-configuration boot
