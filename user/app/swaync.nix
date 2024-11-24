{ config, pkgs, lib, xSettings, ... }: {

  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync/" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/swaync";
  };

  xdg.configFile = {
    "swaync/config.json".enable = false;
    "swaync/style.css".enable = false;
  };
}
