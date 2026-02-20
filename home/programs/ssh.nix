{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  homeDir = config.home.homeDirectory;
  vps_host = builtins.readFile config.sops.secrets.vps_host.path;
  lsw_host = builtins.readFile config.sops.secrets.lsw_host.path;
  lsw_user = builtins.readFile config.sops.secrets.lsw_user.path;
  lsw_port = builtins.readFile config.sops.secrets.lsw_port.path;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "${homeDir}/.ssh/github_id_ed25519";
        identitiesOnly = true;
      };
      lsw = {
        user = lsw_user;
        hostname = lsw_host;
        port = builtins.fromJSON (lsw_port);
        identityFile = "${homeDir}/.ssh/lsw_id_ed25519";
        identitiesOnly = true;
      };
      vps = {
        user = "gitgut";
        hostname = vps_host;
        identityFile = "${homeDir}/.ssh/vps_id_ed25519";
        identitiesOnly = true;
      };
    };
  };
}

