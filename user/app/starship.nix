{ config, pkgs, lib, xSettings, ... }: {

  programs.starship = {
    enable = true;
    settings = lib.importTOML ../conf/starship/starship.toml;
  };
}
