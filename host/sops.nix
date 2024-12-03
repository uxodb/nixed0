{ config, inputs, xSettings,  ... }:

let
  inherit (xSettings) username;
  inherit (config.users.users.uxodb.home) homeDir;
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
      named0_id_rsa = {
        owner = username;
        path = "${homeDir}/.ssh/named0_id_rsa";
      };
      nixed0_id_ed25519 = {  # age key convert
        mode = "0444";
      };
      sshconfig = {
        owner = username;
      };
      userpasswd = {
        neededForUsers = true;
      };
    };
  };
}
