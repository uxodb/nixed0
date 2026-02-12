{
  configs,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  services.noctalia-shell = {
    enable = true;
  };
}
