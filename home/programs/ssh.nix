{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "${config.home.homeDirectory}/.ssh/github_id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}
# extraConfig = builtins.readFile /run/secrets/sshconfig;

