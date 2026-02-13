{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
