{ config, pkgs, lib, xSettings, ... }: {

  programs.fastfetch = {
    enable = true;
  };
  xdg.configFile."fastfetch/" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/fastfetch";
  };

  xdg.configFile = {
    "fastfetch/config.jsonc".enable = false;
  };
}
