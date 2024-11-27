{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.waybar = {
    enable = true;
  };
  
  xdg.configFile."waybar/" = {
    source = mkOutOfStoreSymlink "${appConfig}/waybar";
    recursive = true;
  };
  xdg.configFile = {
    "waybar/config".enable = false;
    "waybar/style.css".enable = false;
  };
}
