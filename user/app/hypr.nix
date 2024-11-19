{ config, pkgs, lib, xSettings, ...}: { 
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  services.hyprpaper.enable = true;

  xdg.configFile = {
    "hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr/hyprpaper.conf";
    "hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr/hyprland.conf";
    "hypr/hyprpaper.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr/hyprpaper.conf";
    "hypr/wallpapers/".source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr/wallpapers";
  };
}

