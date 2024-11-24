{ config, pkgs, lib, xSettings, ...}: { 
  
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
  };

  programs.hyprlock.enable = true;
  # services.hyprpaper.enable = true;

  xdg.configFile = {
    "hypr/hyprlock.conf" = {
      enable = false;
    };
    "hypr/hyprland.conf" = {
      enable = false;
    };
# "hypr/hyprpaper.conf" = {
    #   enable = false;
    # };
    "hypr/" = with xSettings; {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/hypr";
    };
  };
}

