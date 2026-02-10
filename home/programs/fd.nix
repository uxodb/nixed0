{ config, pkgs, lib, xSettings, ... }: {

  programs.fd = {
    enable = true;
    ignores = [".git/"];
    extraOptions = [
      "--one-file-system"
      "--color=always"
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
