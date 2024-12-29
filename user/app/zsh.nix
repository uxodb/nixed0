{ config, pkgs, lib, xSettings, ... }: {

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "eza --color=always --group-directories-first --icons";
      ll = "eza -la --icons --octal-permissions --group-directories-first";
      l = "eza -bGF --header --git --color=always --group-directories-first --icons";
      llm = "eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons";
      la = "eza --long --all --group --group-directories-first";
      lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons";
      lS = "eza -1 --color=always --group-directories-first --icons";
      lt = "eza --tree --level=2 --color=always --group-directories-first --icons";
      "l." = "eza -a | grep -E '^\.'";
    };
    initExtra = ''
      fastfetch
    '';
  };
}
