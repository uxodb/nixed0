{ config, pkgs, lib, xSettings, ... }: {

  programs.eza = {
    enable = true;
    extraOptions = [
      "--icons"
      "--color=always"
      "--group-directories-first"
      "--octal-permissions"
      "--git"
    ];
  };

  ## Aliases
  programs.zsh.shellAliases = {
    ls = "eza";
    ll = "eza -la";
    l = "eza -bGF --header";
    llm = "eza -lbGd --header --sort=modified";
    la = "eza --long --all --group";
    lx = "eza -lbhHigUmuSa@ --time-style=long-iso --color-scale";
    lS = "eza -1"; 
    lt = "eza --tree --level=2"; 
    "l." = "eza -a | grep -E '^\.'";
  };
}
