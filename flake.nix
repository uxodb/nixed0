{
  description = "nixed0";

  inputs = {
 #   nixpkgs-stable.url = "github:NixOS/nixpkgs-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware";
    ucodenix.url = "github:uxodb/ucodenix";

    hyprland = {
      url = "github:hyprwm/Hyprland";
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

  outputs = { self, nixpkgs, home-manager, hyprland, sops-nix, ... }@inputs:

    let
      xSettings = {
        system = "x86_64-linux";
        timezone = "Europe/Amsterdam";
        locale = "en_US.UTF-8";
        username = "uxodb";
	hostname = "nixed0";
      };
    in
  {
    nixosConfigurations.nixed0 = nixpkgs.lib.nixosSystem {
      system = xSettings.system;
      specialArgs = { 
	inherit inputs; 
	inherit xSettings;
      };

      modules = [
        ./host/configuration.nix
        sops-nix.nixosModules.sops
      ];
    };

    homeConfigurations."uxodb@nixed0" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { 
        inherit inputs; 
	inherit xSettings;
      };
      modules = [
        ./user/home.nix
      ];
    };
  };
}
