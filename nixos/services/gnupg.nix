{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
  };
}
