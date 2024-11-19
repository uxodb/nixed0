{ config, pkgs, lib, xSettings, ... }: {

  programs.kitty = {
    enable = true;
    # themeFile = "Catppuccin-Mocha";
  };

  xdg.configFile."kitty/".source = 
    ../conf/kitty/;
}
