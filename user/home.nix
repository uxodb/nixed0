{ config, pkgs, inputs, xSettings, ... }:

{

  imports = [
    ./app
    # ./pkg
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
    packages = with pkgs; [
      bat
      ripgrep
      eza
      tree
      jq
      fzf
      wget
      curl
      nix-search-cli
      wofi
      firefox
      gnumake
      ssh-to-age
      (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    ];
  };
  
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}

