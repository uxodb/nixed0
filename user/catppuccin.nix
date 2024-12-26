{ config, lib, pkgs, inputs, xSettings, ... }: {

  catppuccin = {
    flavor = "mocha";
    accent = "pink";
    zsh-syntax-highlighting.enable = true;
  };
}
