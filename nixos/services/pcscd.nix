{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  services.pcscd = {
    enable = true;
  };
}
