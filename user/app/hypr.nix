{ config, pkgs, lib, xSettings, ...}:

let
  inherit (xSettings) appConfig;
  inherit (config.lib.file) mkOutOfStoreSymlink;
in {
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  services.hyprpaper.enable = true;

  xdg.configFile = {
    "hypr/hyprlock.conf" = {
      enable = false;
    };
    "hypr/hyprland.conf" = {
      enable = false;
    };
    "hypr/hyprpaper.conf" = {
      enable = false;
    };
    "hypr/" = {
      recursive = true;
      source = mkOutOfStoreSymlink "${appConfig}/hypr";
    };
  };
}

