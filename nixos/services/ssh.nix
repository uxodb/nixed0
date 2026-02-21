{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  programs.ssh = {
    startAgent = true;
  };
}
