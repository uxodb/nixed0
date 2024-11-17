{ config, pkgs, inputs, xSettings, ... }:

{

  imports = [
    ./app
    # ./pkg
  ];
  home.username = xSettings.username;
  home.homeDirectory = "/home/${xSettings.username}";
  home.stateVersion = "24.05";
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
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
  fonts.fontconfig.enable = true;
  home.sessionVariables = { 
    EDITOR="nvim";
  };

}

