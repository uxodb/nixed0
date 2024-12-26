{ config, pkgs, inputs, xSettings, ... }:
let
   inherit (xSettings) username;
in {

  imports = [
    ./app
    ./stylix.nix
    ./catppuccin.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [ inputs.hyprpanel.overlay ];
  };

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    sessionVariables = {
      NIXOS_OZONE_WL = 1;
      EDITOR = "nvim";
    };
    packages = builtins.attrValues {
      inherit (pkgs)
      ripgrep
      eza
      tree
      jq
      fd
      fzf
      wget
      curl
      nix-search-cli
      gnumake
      ssh-to-age
      font-awesome
      swww
      plex-desktop
      vesktop
      nautilus
      hyprgui
      parsec-bin
      nix-melt
      hyprpanel
      nwg-displays
      pyprland
      nwg-look;
    };
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  xdg.userDirs.createDirectories = true;

}
