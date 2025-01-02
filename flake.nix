{
  description = "nixed0";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.follows = "hyprland/nixpkgs";
    hardware.url = "github:NixOS/nixos-hardware";
    ucodenix.url = "github:uxodb/ucodenix";
    catppuccin.url = "github:catppuccin/nix?ref=v1.2.1";
    ghostty.url = "github:ghostty-org/ghostty";
    base16.url = "github:SenchoPens/base16.nix";

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
      inputs.hyprland.follows = "hyprland";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel?ref=pull/633/head";
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
    tt-schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
    json2nix = {
      url = "github:sempruijs/json2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:Svenum/Solaar-Flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let 
      xSettings = {
        system = "x86_64-linux";
        timezone = "Europe/Vienna";
        locale = "en_US.UTF-8";
        username = "uxodb";
        hostname = "nixed0";
        appConfig = "${inputs.self}/user/conf";
        theme = "catppuccin-mocha";
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
          inputs.sops-nix.nixosModules.sops
          inputs.catppuccin.nixosModules.catppuccin
          inputs.ucodenix.nixosModules.default
          inputs.solaar.nixosModules.default
          {
            environment.systemPackages = [
              inputs.ghostty.packages.${xSettings.system}.default
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
          inputs.base16.nixosModule
          inputs.hyprland.homeManagerModules.default
          inputs.catppuccin.homeManagerModules.catppuccin
          {scheme = "${inputs.tt-schemes}/base16/${xSettings.theme}.yaml";}
        ];
      };
    };
}
