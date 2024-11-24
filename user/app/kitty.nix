{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
  };

  xdg.configFile."kitty/" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/kitty";
  };

  xdg.configFile."kitty/kitty.conf".enable = false;
}
