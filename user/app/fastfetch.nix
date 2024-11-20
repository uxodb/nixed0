{ config, pkgs, lib, xSettings, ... }: {

  programs.fastfetch = {
    enable = true;
  };
  xdg.configFile."fastfetch/".source =
    config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/fastfetch";

  xdg.configFile = {
    "fastfetch/config.jsonc".enable = false;
  };
}
