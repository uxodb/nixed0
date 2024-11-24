{ config, pkgs, lib, xSettings, ... }: {

  programs.waybar = {
    enable = true;
  };
  
  xdg.configFile."waybar/" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/waybar";
    recursive = true;
  };
  xdg.configFile = {
    "waybar/config".enable = false;
    "waybar/style.css".enable = false;
  };
}
