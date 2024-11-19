{ config, pkgs, lib, xSettings, ... }: {

  programs.waybar = {
    enable = true;
  };
  
  xdg.configFile."waybar/" = {
    enable = false;
    source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/waybar";
    recursive = true;
  };
}
