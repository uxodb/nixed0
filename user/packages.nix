{ config, pkgs, inputs, ... }: {

  home.packages = builtins.attrValues {
    inherit (pkgs)
    tree
    jq
    curl
    nix-search-cli
    ssh-to-age
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
    gnome-calendar
    gnome-clocks
    nwg-look;
  };
}
