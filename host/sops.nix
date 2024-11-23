{ config, inputs, xSettings, ... }:

{
  sops = {
    defaultSopsFile = ../secrets.json;
    age.keyFile = "/home/${xSettings.username}/.config/sops/age/keys.txt";
    # age.sshKeyPaths = [ "/home/uxodb/nixed0_id_ed25519" ];
    secrets = {
      github_id_ed25519 = {
        owner = xSettings.username;
	path = "/home/${xSettings.username}/.ssh/github_id_ed25519";
      };
      named0_id_rsa = {
        owner = xSettings.username;
        path = "/home/${xSettings.username}/.ssh/named0_id_rsa";
      };
      nixed0_id_ed25519 = {mode = "0444";}; # age key convert
      sshconfig = {
        owner = xSettings.username;
      };
      userpasswd = {
        neededForUsers = true;
      };
    };
  };
}
