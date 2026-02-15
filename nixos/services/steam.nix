{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs = {
    steam = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };
}
