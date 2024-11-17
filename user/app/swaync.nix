{ config, pkgs, lib, xSettings, ... }: {

  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync".source = ../conf/swaync;
}
