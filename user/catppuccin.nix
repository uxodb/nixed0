{ config, lib, pkgs, inputs, xSettings, ... }: {

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
}
