{ config, pkgs, lib, xSettings, ... }: {

  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync/" = {
    enable = false;
    source = config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/swaync";
  };
}
