{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {
  xdg.configFile."niri/config.kdl" = {
    recursive = true;
    source = mkOutOfStoreSymlink "${appConfig}/niri/config.kdl";
  };
}
