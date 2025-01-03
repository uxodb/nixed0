{ config, pkgs, lib, xSettings, ... }:

let
  inherit (xSettings) appConfig;
in {

  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override {
      enableWlrSupport = true;
    };
    # settings = "";
  };

}
