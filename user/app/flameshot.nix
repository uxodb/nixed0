{ config, pkgs, lib, xSettings, ... }:

let
  inherit (xSettings) appConfig;
  inherit (config.home) homeDirectory;
in {

  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {
      enableWlrSupport = true;
    };
    settings = {
      General = {
        filenamePattern = "%j%V-%e%m%Y-%H%M";
        savePath = "${homeDirectory}/Pictures/Screenshots";
        savePathFixed = false;
      };
    };
  };

}
