{ config, pkgs, lib, xSettings, ...}: { 
  
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
    "hypr/wallpapers/" = {
      enable = false;
    };
    "hypr/" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr"
    };
  };
}

