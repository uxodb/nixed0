{ config, pkgs, lib, xSettings, ... }:

let
  inherit (xSettings) appConfig;
in {

  programs.rofi = {
    enable = true;
  };
}
