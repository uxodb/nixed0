{ config, lib, pkgs, inputs, xSettings, ... }: {

  stylix = {
    enable = true;
    polarity = "dark";
    image = ./conf/hypr/wallpapers/wp.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    targets = {
      hyprpaper.enable = lib.mkForce false;
      neovim.enable = false;
      swaync.enable = false;
      feh.enable = false;
      firefox.enable = false;
      fuzzel.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
      kitty.enable = false;
      waybar.enable = false;
    };
  };
  services.hyprpaper.enable = lib.mkForce false;
}
