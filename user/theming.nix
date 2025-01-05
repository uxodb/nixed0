{ config, lib, pkgs, inputs, xSettings, ... }: 

let
  inherit (xSettings) appConfig;
in {

  gtk.enable = true;
  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

  home.pointerCursor = {
    package = pkgs.lyra-cursors;
    # package = pkgs.rose-pine-cursor;
    # $out/share/icons/${cfg.name}
    # name = "BreezeX-RosePine-Linux";
    # F=peach B=blue G=orange P=purple/blue Q=blue/purple(light)
    # R=pink/purple S=red X=green Y=slimegreen
    name = "LyraX-cursors";
    size = 32;
    gtk.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["FantasqueSansM Nerd Font"];
      serif = ["FantasqueSansM Nerd Font"];
      sansSerif = ["FantasqueSansM Nerd Font"];
      emoji = ["Noto Color Emoji"];
    };
  };

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
    kvantum.enable = true;
  };

  # programs.rofi.theme = (config.scheme inputs.base16-rofi);
  # programs.rofi.theme = "${xSettings.appConfig}/rofi/style_3.rasi";

  # eza
  xdg.configFile."eza/theme.yml" = {
    source = "${appConfig}/eza/catppuccin.yml";
  };
}
