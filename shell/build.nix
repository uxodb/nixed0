{ pkgs, xSettings }:

let
  buildmenu = pkgs.writeShellScriptBin "menu"
    (builtins.readFile ./build.sh);
in 

pkgs.mkShellNoCC {

  depsBuildBuild = [ buildmenu ];

  packages = builtins.attrValues {
    inherit (pkgs)
    just
    git
    sops
    bitwarden-cli
    home-manager;
  };

  shellHook = ''
    echo "##############################################################"
    echo "#### Entered shell with just, git, sops and home-manager ####"
    echo "#### --                                                   ####"
    echo "#### \"menu\" to enter menu                                 ####"
    echo "##############################################################"
  '';
}
