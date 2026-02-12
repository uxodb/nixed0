{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--max-columns=100"
      "--max-columns-preview"
      "--hidden"
      "--glob=!.git/*"
      "--smart-case"
    ];
  };
}
