{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/" = { 
    enable = false;
    source = ../conf/kitty;
  };
}
