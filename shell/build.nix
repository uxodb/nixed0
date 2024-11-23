{ pkgs }:
with pkgs;
mkShell {
  buildInputs = [
    cmake
    git
    sops
    home-manager
  ];

  shellHook = ''
    echo "##############################################################"
    echo "#### Entered shell with cmake, git, sops and home-manager ####"
    echo "#### --                                                   ####"
    echo "#### Remember, ~/.config/sops/age/keys.txt                ####"
    echo "##############################################################"
  '';
}
