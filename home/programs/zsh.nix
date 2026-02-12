{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    syntaxHighlighting.enable = true;
    shellAliases = {
      # eza.nix
      # fzf.nix
      # fd.nix
    };
    initExtra = ''
      fastfetch
    '';
  };
}
