set quiet := true
set fallback := true
set shell := ["bash", "-c"]
PATH := "~/nixed0"
FLAKE := "nixed0"
PROFILE := "uxodb"

#recipe +PARAM="":
#  just info "{{PARAM}}"
#  run {{PARAM}}

[doc('Show this list')]
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

#######
##OPS##
#######
[doc("Switch NixOS or HM config or both. nixos,home,all")]
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

[doc("Collect garbage and also collect and rebuild boot with: all")]
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



[doc("Update inputs or single input. <input>")]
update +inputs="all":
  #!/usr/bin/env bash
  if [[ "{{inputs}}" == "all" ]]; then
    just warn "Updating all flake inputs.."
    sleep 1
    sudo nix flake update;
  else
    just info "Updating flake inputs: {{inputs}}"
    sleep 1
    sudo nix flake update {{inputs}};
  fi

[doc("Search for nixos and hm options. <option>")]
search option:
  just info "Looking for option <{{option}}> in hm- and nixos-options"
  manix {{option}} --source hm-options,nixos-options

[doc("Show latest home-manager news")]
news:
  home-manager news --flake {{PATH}}#{{PROFILE}}

[doc("Optimise store (hardlinks)")]
optimise:
  just info "Optimise store..."
  sudo nix-store --optimise

[doc("Set current generation as default boot gen")]
setboot:
  just warn "Setting default boot generation to current..."
  sleep 2
  sudo /run/current-system/bin/switch-to-configuration boot

########
##PREP##
########
[doc("Set ssh remote for the repo")]
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

[doc("NixOS install in /mnt/")]
build:
  just warn "do not forget mounts"
  just warn "do not forget mounts"
  sleep 3
  nixos-install --root /mnt/ --flake {{PATH}}#{{FLAKE}}

########
##PRIV##
########
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

[private]
alias s := switch
