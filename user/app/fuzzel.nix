{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.fuzzel = {
    enable = true;
  };
  xdg.configFile."fuzzel/" = {
    source = mkOutOfStoreSymlink "${appConfig}/fuzzel";
  };

  xdg.configFile = {
    "fuzzel/fuzzel.ini".enable = false;
  };
}
