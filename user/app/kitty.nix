{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
    # themeFile = "Catppuccin-Mocha";
  };

  xdg.configFile."kitty/kitty.conf".source = 
    ../conf/kitty/kitty.conf;
}
