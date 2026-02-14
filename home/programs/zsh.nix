{
  config,
  pkgs,
  lib,
  xSettings,
  ...
}: let
  inherit (config.home) homeDirectory;
in {
  programs.zsh = {
    enable = true;
    completionInit = "autoload -Uz compinit && compinit";
    dotDir = "${config.xdg.configHome}/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    dirHashes = {
      docs = "${homeDirectory}/Documents";
      dl = "${homeDirectory}/Downloads";
      pics = "${homeDirectory}/Pictures";
      vids = "${homeDirectory}/Videos";
      games = "${homeDirectory}/Games";
      proj = "${homeDirectory}/Projects";
      ss = "${homeDirectory}/Screenshots";
      casts = "${homeDirectory}/Screencasts";
    };
    setOptions =
      [
        "NO_BEEP"
        "NOMATCH"
        "NOTIFY"
        "NO_EXTENDEDGLOB"
        "PUSHD_TO_HOME"
        "GLOB_DOTS"
        "SHORT_LOOPS"
        "CHECK_JOBS"
        "C_BASES"
      ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      # eza.nix
      # fzf.nix
      # fd.nix
    };
    initContent = ''
      fastfetch
    '';
    history = {
      path = "${config.programs.zsh.dotDir}/.zsh_history";
      append = false;
      findNoDups = false;
      extended = true;
      ignoreSpace = true;
      save = 10000;
      share = true;
      size = 10000;

    };
  };
}
