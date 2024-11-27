{ config, pkgs, inputs, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  home.packages = [
    pkgs.wleave
  ];
  xdg.configFile."wleave" = {
    source = mkOutOfStoreSymlink "${appConfig}/wleave";
  };
}
