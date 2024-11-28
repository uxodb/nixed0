{ config, pkgs, lib, xSettings, ... }:

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = [
      pkgs.gcc
      pkgs.nodejs_23
      pkgs.unzip
    ];
  };

  xdg.configFile."nvim/" = {
    recursive = true;
    source = mkOutOfStoreSymlink "${appConfig}/nvim";
  };
}
