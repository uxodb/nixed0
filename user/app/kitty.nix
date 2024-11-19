{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/".source = 
    ../conf/kitty/;
}
