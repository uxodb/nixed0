{
  config,
  inputs,
  xSettings,
  ...
}: let
  inherit (xSettings) hostname;
  homeDir = config.home.homeDirectory;
in {
  sops = {
    defaultSopsFile = ./secrets.json;
    age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
    secrets = {
      vps_host = {};
      lsw_host = {};
      lsw_user = {};
      lsw_port = {};
    };
  };
}
