{ config, pkgs, lib, xSettings, ... }: {

  programs.waybar = {
    enable = true;
  };
  
  xdg.configFile."waybar/" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/waybar";
    recursive = true;
  };
  xdg.configFile = {
    "waybar/config".enable = false;
    "waybar/style.css".enable = false;
  };
}
