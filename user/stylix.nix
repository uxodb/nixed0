{ config, lib, pkgs, inputs, xSettings, ... }: {

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    image = ../assets/wallpapers/wp.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    fonts = {
      sizes = {
        desktop = 10;
        popups = 12;
        terminal = 12;
      };
      sansSerif = {
        name = "FantasqueSansM Nerd Font";
        package = pkgs.nerd-fonts.fantasque-sans-mono;
      };
      monospace = {
        name = "FantasqueSansM Nerd Font";
        package = pkgs.nerd-fonts.fantasque-sans-mono;
      };
    };
    targets = {
      # hyprpaper.enable = lib.mkForce false;
      neovim.enable = false;
      firefox.enable = false;
      hyprlock.enable = false;
      waybar.enable = false;
    };
  };
  # services.hyprpaper.enable = lib.mkForce false;
}
