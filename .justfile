set quiet
set shell := ["bash", "-c"]
PATH := "~/nixed0"
FLAKE := "nixed0"
PROFILE := "uxodb"

help *args="":
  #!/usr/bin/env bash
  if [ -z "{{args}}" ]; then
    just --list
  else
    if just --summary | grep -q "^{{args}}\b"; then
      just info "Info for recipe: {{args}}"
      just --show {{args}}
    else
      just error "Recipe '{{args}}' not found"
      just --list
    fi
  fi

## OPS ##
switch option="home":
  #!/usr/bin/env bash
  case "{{option}}" in
    "nixos")
      just warn "Switching NixOS configuration..."
      sudo nixos-rebuild switch --flake {{PATH}}#{{FLAKE}}
      ;;
    "home")
      just warn "Switching home-manager configuration..."
      home-manager switch --impure --flake {{PATH}}#{{PROFILE}}
      ;;
    "all")
      just warn "Switching both NixOS and HM configurations..."
      home-manager switch --impure --flake {{PATH}}#{{PROFILE}}
      sudo nixos-rebuild switch --flake {{PATH}}#{{FLAKE}}
      ;;
    *)
      just error "Invalid option: {{option}}"
      just info "Available options: nixos, home, all"
      exit 1
      ;;
  esac

clean *args="":
  #!/usr/bin/env bash
  if [[ "{{args}}" == "all" ]]; then
    just warn "Garbage collector: collect all and rebuild boot"
    sleep 1
    sudo nix-collect-garbage
    sudo nix-collect-garbage --delete-old
    sudo nixos-rebuild boot --flake {{PATH}}#{{FLAKE}}
  else 
    just warn "Garbage collector: unreferenced packages"
    sleep 1
    sudo nix-collect-garbage
  fi

update input="all":
  #!/usr/bin/env bash
  if [[ "{{input}}" == "all" ]]; then
    just warn "Updating all flake inputs.."
    sleep 1
    sudo nix flake update;
  else
    just info "Updating flake input: {{input}}..." 
    sleep 1
    sudo nix flake update {{input}};
  fi

news:
  home-manager news --flake {{PATH}}#{{PROFILE}}

optimise:
  just info "Optimise store..."
  sudo nix-store --optimise

setboot:
  just warn "Setting default boot generation!"
  sleep 2
  sudo /run/current-system/bin/switch-to-configuration boot

## PREP ##
git:
  #!/usr/bin/env bash
  if [[ "$PWD" != "~/nixed0" ]]; then
    just warn "PWD is not repo, moving into repo"
    cd ~/nixed0/
  fi
  just info "Current remote:"
  git remote -v
  just warn "Setting new remote..."
  git remote set-url origin git@github.com:uxodb/nixed0.git
  just info "Remote set"
  git remote -v

build:
  just warn "do not forget mounts"
  just warn "do not forget mounts"
  sleep 3
  nixos-install --root /mnt/ --flake {{PATH}}#{{FLAKE}}

## PRIVATE ##
BLUE := '\033[1;30;44m'
RED := '\033[1;30;41m'
YELLOW := '\033[1;30;43m'
NC := '\033[0m'

[private]
info msg:
  @echo -e "{{BLUE}} => {{NC}} {{msg}}"

[private]
warn msg:
  @echo -e "{{YELLOW}} !? {{NC}} {{msg}}"

[private]
error msg:
  @echo -e "{{RED}} != {{NC}} {{msg}}"
