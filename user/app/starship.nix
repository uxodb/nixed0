{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.starship = {
    enable = true;
  };

  xdg.configFile."starship.toml" = {
    source = mkOutOfStoreSymlink "${appConfig}/starship/starship.toml"
  };
}
