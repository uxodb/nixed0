{ config, pkgs, inputs, xSettings, ... }:

{
  home.packages = [
    pkgs.wleave
  ];
  xdg.configFile."wleave" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/wleave";
  };
}
