{ config, pkgs, inputs, xSettings, ... }:
let
   inherit (xSettings) username;
in {

  imports = [
    ./app
    ./theming.nix
    ./packages.nix
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
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = null;
    music = null;
    publicShare = null;
    templates = null;
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
      XDG_GAMES_DIR = "${config.home.homeDirectory}/Games";
      XDG_MISC_DIR = "${config.home.homeDirectory}/Miscellaneous";
    };
  };
}
