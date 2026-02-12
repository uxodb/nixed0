{
  pkgs,
  xSettings,
}:
pkgs.mkShellNoCC {
  packages = builtins.attrValues {
    inherit
      (pkgs)
      just
      git
      jq
      sops
      bitwarden-cli
      nh
      home-manager
      ;
  };

  shellHook = ''
    echo "################################################################################"
    echo "################################################################################"
    echo "################################################################################"
    echo "#### Entered shell with just, jq, git, sops, home-manager and bitwarden-cli ####"
    echo "#### --                                                                     ####"
    echo "#### Run 'just build' to start building the configuration                   ####"
    echo "################################################################################"
    echo "################################################################################"
    echo "################################################################################"
  '';
}
