{ config, pkgs, inputs, ... }: {

  home.packages = builtins.attrValues (
    let
      flakePackages = builtins.mapAttrs (
        name: value: value.packages.${pkgs.system}.default) {
          inherit (inputs)
          json2nix;
        };
      nixPackages = {
        inherit (pkgs.kdePackages)
        okular
        qtstyleplugin-kvantum;
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
        # veracrypt
        # qbittorrent
        mpc-qt
        # seafile-client
        protonvpn-gui
        protonmail-desktop
        whatsapp-for-linux
        p7zip
        nwg-look;
      };
    in 
      nixPackages // flakePackages
  );
}
