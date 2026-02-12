{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = builtins.attrValues {
      inherit
        (pkgs)
        gcc
        nodejs_25
        unzip
        ;
    };
  };

  xdg.configFile."nvim/" = {
    recursive = true;
    source = mkOutOfStoreSymlink "${appConfig}/nvim";
  };
}
