{
  config,
  inputs,
  xSettings,
  ...
}: let
  inherit (xSettings) username;
  homeDir = config.users.users.uxodb.home;
in {
  sops = {
    defaultSopsFile = ../secrets.json;
    age.keyFile = "${homeDir}/.config/sops/age/keys.txt";
    # age.sshKeyPaths = [ "${homeDir}/nixed0_id_ed25519" ];
    secrets = {
      github_id_ed25519 = {
        owner = username;
        path = "${homeDir}/.ssh/github_id_ed25519";
      };
      lsw_id_ed25519 = {
        owner = username;
        path = "${homeDir}/.ssh/lsw_id_ed25519";
      };
      vps_id_ed25519 = {
        owner = username;
        path = "${homeDir}/.ssh/vps_id_ed25519";
      };
      nixed0_id_ed25519 = {
        # age key convert
        mode = "0444";
      };
      userpasswd = {
        neededForUsers = true;
      };
    };
  };
}
