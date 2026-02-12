{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  programs.ssh = {
    startAgent = false;
  };
}
