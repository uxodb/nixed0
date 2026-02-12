{ config, pkgs, inputs, xSettings, ... }:
let
   inherit (xSettings) username;
in {

  imports = [
    ./programs
    ./theming.nix
    ./packages.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [ 
      (import ../overlays/manix.nix)
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
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      music = null;
      publicShare = null;
      templates = null;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      pictures = "$HOME/Pictures";
      videos = "$HOME/Videos";
      extraConfig = {
        XDG_PROJECTS_DIR = "$HOME/Projects";
        XDG_GAMES_DIR = "$HOME/Games";
        XDG_MISC_DIR = "$HOME/Misc";
        XDG_SCREENSHOTS_DIR = "$HOME/Pictures/Screenshots";
        XDG_SCREENCASTS_DIR = "$HOME/Videos/Screencasts";
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "firefox.desktop" ];
      };
    };
  };
}
