{ config, pkgs, lib, xSettings, ... }: {

  programs.ssh = {
    enable = true;
    serverAliveInterval = 60;
    serverAliveCountMax = 6;
    extraConfig = builtins.readFile /run/secrets/sshconfig;
  };
}
