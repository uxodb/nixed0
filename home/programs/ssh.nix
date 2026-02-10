{ config, pkgs, lib, xSettings, ... }: {

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    serverAliveInterval = 60;
    serverAliveCountMax = 6;
    extraConfig = builtins.readFile /run/secrets/sshconfig;
  };
}
