{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: let
  inherit (xSettings) username;
in {
  imports = [
    ./programs
    ./theming.nix
    ./packages.nix
    ./sops.nix
    ./misc/packages.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
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
        PROJECTS = "$HOME/Projects";
        GAMES = "$HOME/Games";
        MISC = "$HOME/Misc";
        SCREENSHOTS = "$HOME/Pictures/Screenshots";
        SCREENCASTS = "$HOME/Videos/Screencasts";
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = ["firefox.desktop"];
        "x-scheme-handler/http" = ["firefox.desktop"];
        "x-scheme-handler/https" = ["firefox.desktop"];
        "video/mp4" = ["mpv.desktop"];
        "video/matroska" = ["mpv.desktop"];
        "video/WebM" = ["mpv.desktop"];
        "image/jpeg" = ["feh.desktop"];
        "image/png" = ["feh.desktop"];
        "image/gif" = ["feh.desktop"];
        "image/webp" = ["feh.desktop"];
        "application/rdp" = ["remmina.desktop"];
      };
    };
  };
}
