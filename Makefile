$(eval boot:;@:)
TASK = dry-activate test switch
FLAKE = nixed0
PROFILE = uxodb

.PHONY: $(TASK)
$(TASK):
	sudo nixos-rebuild $@ --flake .#$(FLAKE)

.PHONY: home news
home:
ifeq (news, $(filter news,$(MAKECMDGOALS)))
	@echo "Getting home-manager news"
else
	@echo "Switching home-manager profile..."
endif
	@sleep 2
	@home-manager \
	$(if $(filter news,$(MAKECMDGOALS)), news, switch) \
	--impure --flake .#$(PROFILE)
%:
	@:

.PHONY: update
update:
	nix flake update

.PHONY: build
build:
	@echo "Don't forget to mount volumes!!!"
	@echo "Don't forget to mount volumes!!!"
	@sleep 2
	nixos-install --root /mnt/ --flake .#$(FLAKE)

.PHONY: optimise
optimise:
	sudo nix-store --optimise

.PHONY: setgen
setgen:
	sudo /run/current-system/bin/switch-to-configuration boot

.PHONY: clean boot
clean:
ifeq (boot, $(filter boot,$(MAKECMDGOALS)))
	@echo "Garbage collector: delete old roots"
	@sleep 1
	@sudo nix-collect-garbage
	@sudo nix-collect-garbage --delete-old
	@sudo nixos-rebuild boot --flake .#$(FLAKE)
else
	@echo "Garbage collector: unreferenced packages"
	@sleep 1
	@sudo nix-collect-garbage
endif
