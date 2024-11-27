{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/" = {
    source = mkOutOfStoreSymlink "${appConfig}/kitty";
  };

  xdg.configFile."kitty/kitty.conf".enable = false;
}
