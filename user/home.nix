{ config, pkgs, inputs, xSettings, ... }:

{

  imports = [
    ./app
    ./stylix.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home = with xSettings; {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
    packages = builtins.attrValues {
      inherit (pkgs)
      bat
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
      nwg-look;
    };
  };
  
  programs.home-manager.enable = true;

    fonts.fontconfig.enable = true;
}
