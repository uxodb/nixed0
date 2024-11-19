{ config, pkgs, lib, xSettings, ...}: { 
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
  };

  programs = {
    hyprlock.enable = true;
    hyprpaper.enable = true;
  };

  xdg.configFile."hypr/".source =
    config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/hypr";
}

