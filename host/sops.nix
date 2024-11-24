{ config, inputs, xSettings,  ... }:

{
  sops = with xSettings; {
    defaultSopsFile = ../secrets.json;
    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";
    # age.sshKeyPaths = [ "/home/uxodb/nixed0_id_ed25519" ];
    secrets = {
      github_id_ed25519 = {
        owner = username;
	path = "/home/${username}/.ssh/github_id_ed25519";
      };
      named0_id_rsa = {
        owner = username;
        path = "/home/${username}/.ssh/named0_id_rsa";
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
