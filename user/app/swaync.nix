{ config, pkgs, lib, xSettings, ... }: {

  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync/".source =
    config.lib.file.mkOutOfStoreSymlink "/home/uxodb/flakes/user/conf/swaync";

  xdg.configFile = {
    "swaync/config.json".enable = false;
    "swaync/style.css".enable = false;
  };
}
