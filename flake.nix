{
  description = "nixed0";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware";
    ucodenix.url = "github:uxodb/ucodenix";
    catppuccin.url = "github:catppuccin/nix";

    hyprland = {
      url = "github:hyprwm/Hyprland?rev=e75e2cdac79417ffdbbbe903f72668953483a4e7";#?ref=v0.46.2";
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
  };

  outputs = 
    { self, nixpkgs, home-manager, hyprland, sops-nix, catppuccin, ... }@inputs:
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
          inputs.ucodenix.nixosModules.default
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
          catppuccin.homeManagerModules.catppuccin
        ];
      };
    };
}
