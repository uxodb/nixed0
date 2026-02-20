{ config, inputs, xSettings, ... }:
let
  inherit (xSettings) hostname;
  homeDir = config.home.homeDirectory;
in{
  sops = {
    defaultSopsFile = ./secrets.json;
    age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
    secrets = {
      vps_host = {
        # path = "%r/vps_hostname.txt";
      };
      lsw_host = {
        # path = "%r/lsw_hostname.txt";
      };
      lsw_user = {
        # path = "%r/lsw_user.txt";
      };
      lsw_port = {
        # path = "%r/lsw_port.txt";
      };
    };
  };
}
