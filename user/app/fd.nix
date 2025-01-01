{ config, pkgs, lib, xSettings, ... }: {

  programs.fd = {
    enable = true;
    extraOptions = [
      "--one-file-system"
      "--color=always"
      "--exclude '.git'"
      "--list-details"
      "--no-require-git"
      "--hidden"
    ];
  };

  ## Aliases
  programs.zsh.shellAliases = {
    find = "fd";
  };
}
