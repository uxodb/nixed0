{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: {
  programs.git = {
    enable = true;
    settings.user = {
      name = "uxodb";
      email = "20535246+${xSettings.username}@users.noreply.github.com";
    };
    extraConfig.init.defaultBranch = "main";
  };
}
