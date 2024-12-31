{ config, pkgs, lib, xSettings, ... }: {

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--preview='head -$LINES {}'"
    ];
  };

  ## Aliases
  programs.zsh.shellAliases = {
    fzf = "nvim $(fzf)";
  };
}
