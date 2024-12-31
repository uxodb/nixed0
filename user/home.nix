{ config, pkgs, inputs, xSettings, ... }:
let
   inherit (xSettings) username;
in {

  imports = [
    ./app
    ./theming.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [ 
      inputs.hyprpanel.overlay 
      (import ../overlay/manix.nix)
    ];
  };

  # for manix overlay
  manual.json.enable = true;

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
      parsec-bin
      nix-melt
      hyprpanel
      nwg-displays
      pyprland
      waypaper
      nix-health
      manix
      google-chrome
      nwg-look;
    };
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 32;
      gtk.enable = true;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["FantasqueSansM Nerd Font"];
      serif = ["FantasqueSansM Nerd Font"];
      sansSerif = ["FantasqueSansM Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
  };
  gtk.enable = true;

  programs.home-manager.enable = true;
  xdg.userDirs.createDirectories = true;

}
