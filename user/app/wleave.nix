{ config, pkgs, inputs, xSettings, ... }:

{
  home.packages = [
    pkgs.wleave
  ];
  xdg.configFile."wleave" = {
    enable = false;
    source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/wleave";
  };
}
