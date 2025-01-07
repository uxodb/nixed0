{ config, pkgs, lib, xSettings, ... }:

let
  inherit (xSettings) appConfig;
in {

  home.packages = [
    pkgs.pyprland
  ];

  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = [
      "expose"
    ]

    [expose]
    include_special = false
  '';

}
