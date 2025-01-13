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
        swww
        plex-desktop
        vesktop
        nautilus
        parsec-bin
        hyprpanel
        nwg-displays
        waypaper
        google-chrome
        gnome-calendar
        gnome-clocks
        # veracrypt
        # qbittorrent
        mpc-qt
        mpv
        # seafile-client
        protonvpn-gui
        protonmail-desktop
        whatsapp-for-linux
        p7zip
        wl-clipboard
        obs-studio
        wl-screenrec
        wf-recorder
        slurp
        swappy
        # qalculate-qt
        # qalculate-gtk
        ghostty
        nwg-look;
      };
    in 
      nixPackages // flakePackages
  );
}
