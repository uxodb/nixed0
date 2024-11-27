{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync/" = {
    source = mkOutOfStoreSymlink "${appConfig}/swaync";
  };

  xdg.configFile = {
    "swaync/config.json".enable = false;
    "swaync/style.css".enable = false;
  };
}
