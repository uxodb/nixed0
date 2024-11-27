{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.fastfetch = {
    enable = true;
  };
  xdg.configFile."fastfetch/" = {
    source = mkOutOfStoreSymlink "${appConfig}/fastfetch";
  };

  xdg.configFile = {
    "fastfetch/config.jsonc".enable = false;
  };
}
