{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = builtins.attrValues (
    let
      flakePackages =
        builtins.mapAttrs (
          name: value: value.packages.${pkgs.stdenv.hostPlatform.system}.default
        ) {
          inherit
            (inputs)
            json2nix
            ;
        };
      nixPackages = {
        inherit
          (pkgs.kdePackages)
          okular
          qtstyleplugin-kvantum
          ;
        inherit
          (pkgs)
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
          heroic
          keepassxc
          mpc-qt
          mpv
          nautilus
          nwg-displays
          nwg-look
          obs-studio
          p7zip
          piper
          proton-pass
          protonmail-desktop
          protonvpn-gui
          proton-vpn-cli
          signal-desktop
          slurp
          swappy
          swww
          vesktop
          waypaper
          wf-recorder
          wireguard-tools
          wl-clipboard
          wl-screenrec
          xwayland-satellite
          ;
      };
    in
      nixPackages // flakePackages
  );
}
