{ config, pkgs, lib, xSettings, ... }: {

  programs.waybar = {
    enable = true;
    #settings = lib.importJSON ../conf/waybar/config.jsonc;
  };
  
  xdg.configFile."waybar/" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/waybar";
    # source = ../conf/waybar;
    recursive = true;
  };
}
