{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.feh = {
    enable = true;
  };
  xdg.configFile."feh/" = {
    source = mkOutOfStoreSymlink "${appConfig}/feh";
  };

  xdg.configFile = {
    "feh/buttons".enable = false;
    "feh/keys".enable = false;
  };
}
