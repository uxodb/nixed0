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
  programs.feh = {
    enable = true;
    buttons = {
      next_img = 4;
      prev_img = 5;
      zoom_in = "C-4";
      zoom_out = "C-5";
    };
  };
}
