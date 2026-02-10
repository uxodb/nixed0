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
      "expose",
      "scratchpads"
    ]

    [expose]
    include_special = false

    [scratchpads.kitty]
    command = "kitty --class kitty-dropterm"
    lazy = true
  '';

}
