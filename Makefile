.PHONY: nixos home update clean whatif test rollback build

makeRoot:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

nixos:
	sudo nixos-rebuild switch --flake .#nixed0

home:
	home-manager switch --impure --flake .#uxodb

update:
	sudo nix flake update

build:
	@echo "Don't forget to mount volumes!!!"
	@echo "Don't forget to mount volumes!!!"
	@sleep 5
	nixos-install --root /mnt/ --flake .#nixed0

whatif: 
	sudo nixos-rebuild dry-activate --flake .#nixed0

test:
	sudo nixos-rebuild test --flake .#nixed0

rollback:
	sudo nixos--rebuild --rollback switch

clean:
	nix-collect-garbage --delete-old
	sudo nix-collect-garbage --delete-old
	sudo /run/current-system/bin/switch-to-configuration boot
