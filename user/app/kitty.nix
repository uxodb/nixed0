{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/".source = 
    config.lib.file.mkOutOfStoreSymlink /home/uxodb/flakes/user/conf/kitty;

  xdg.configFile."kitty/kitty.conf".enable = false;
}
