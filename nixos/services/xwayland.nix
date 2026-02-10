{ config, pkgs, inputs, xSettings, ... }: {

  programs.xwayland = {
    enable = true;
  };
}
