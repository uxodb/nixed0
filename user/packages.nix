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
        # hyprpanel
        # qalculate-gtk
        # qalculate-qt
        # qbittorrent
        # seafile-client
        # veracrypt
	dconf
        ghostty
        gnome-calendar
        gnome-clocks
        google-chrome
        keepassxc
        mpc-qt
        mpv
        nautilus
        nwg-displays
        nwg-look
        obs-studio
        p7zip
        parsec-bin
        plex-desktop
        proton-pass
        protonmail-desktop
        protonvpn-gui
        slurp
        swappy
        swww
        vesktop
        waypaper
        wf-recorder
        wl-clipboard
        wl-screenrec;
      };
    in 
      nixPackages // flakePackages
  );
}
