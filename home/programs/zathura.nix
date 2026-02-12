{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (xSettings) appConfig;
in {
  programs.zathura = {
    enable = true;
  };
}
