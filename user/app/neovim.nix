{ config, pkgs, lib, xSettings, ... }: {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
