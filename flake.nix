{
  description = "nixed0";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware";
    ucodenix.url = "github:uxodb/ucodenix";
    catppuccin.url = "github:catppuccin/nix";

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "pomodoro-cli/flake-utils";
        flake-compat.follows = "hyprland/pre-commit-hooks/flake-compat";
        home-manager.follows = "home-manager";
        systems.follows = "hyprland/systems"; # Needs fix
      };
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    Hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };

    dynamicpointer = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs = {
        hyprland.follows = "hyprland";
        nixpkgs.follows = "nixpkgs";
      };
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pomodoro-cli = {
      url = "github:uxodb/nixed0?dir=user/pkg/pomodoro-cli";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.inputs.systems.follows = "hyprland/systems"; # Needs Fix
      };
   };
  };


  outputs = 
    { self, nixpkgs, home-manager, hyprland, sops-nix, pomodoro-cli, catppuccin, stylix, ... }@inputs:
    let 
      xSettings = {
        system = "x86_64-linux";
        timezone = "Europe/Vienna";
        locale = "en_US.UTF-8";
        username = "uxodb";
        hostname = "nixed0";
        appConfig = "/home/uxodb/nixed0/user/conf";
      };
      xpkgs = nixpkgs.legacyPackages.${xSettings.system};
    in
    {
      devShells.${xSettings.system} = {
        default = import ./shell/build.nix { pkgs = xpkgs; inherit xSettings; };
      };

      nixosConfigurations.nixed0 = nixpkgs.lib.nixosSystem {
        system = xSettings.system;
        specialArgs = { 
	  inherit inputs; 
	  inherit xSettings;
        };
        modules = [
          ./host/configuration.nix
          sops-nix.nixosModules.sops
          stylix.nixosModules.stylix
	  {
	    environment.systemPackages = with xSettings; [
              pomodoro-cli.packages.${system}.pomodoro-cli
            ];
	  }
        ];
      };

      homeConfigurations."uxodb" = home-manager.lib.homeManagerConfiguration {
        pkgs = xpkgs;
        extraSpecialArgs = { 
          inherit inputs; 
	  inherit xSettings;
        };
        modules = [
          ./user/home.nix
          inputs.hyprland.homeManagerModules.default
          stylix.homeManagerModules.stylix
          catppuccin.homeManagerModules.catppuccin
          {
            nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
            catppuccin.flavor = "mocha";
            # catppuccin.pointerCursor.enable = true;
            catppuccin.accent = "peach";
            # home.pointerCursor.gtk.enable = true;
            # gtk.catppuccin.enable = false;
            # gtk.enable = false;
          }
        ];
      };
    };
}
