{
  configs,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  programs.niri = {
    enable = true;
  };
}
