{ config, lib, pkgs, inputs, xSettings, ... }: 

let
  inherit (xSettings) appConfig;
in {

  catppuccin = {
    flavor = "mocha";
    accent = "pink";
    hyprland.enable = true;
    zsh-syntax-highlighting.enable = true;
    kitty.enable = true;
    fuzzel.enable = true;
    bat.enable = true;
    fzf.enable = true;
    gtk.enable = true;
    gtk.icon.enable = true;
  };

  # programs.rofi.theme = (config.scheme inputs.base16-rofi);
  # programs.rofi.theme = "${xSettings.appConfig}/rofi/style_3.rasi";

  # eza
  xdg.configFile."eza/catppuccin.yml" = {
    source = "${appConfig}/eza/catppuccin.yml";
  };
}
