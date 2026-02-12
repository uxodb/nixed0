{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "uxodb";
    userEmail = "20535246+${xSettings.username}@users.noreply.github.com";
    extraConfig.init.defaultBranch = "main";
  };
}
