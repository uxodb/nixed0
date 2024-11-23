{ pkgs, xSettings }:
with pkgs;
mkShell {
  buildInputs = [
    cmake
    git
    sops
    home-manager
  ];

  shellHook = ''
    mkdir /home/uxodb/.ssh
    mkdir -p /home/uxodb/.config/sops/age
    echo "##############################################################"
    echo "#### Entered shell with cmake, git, sops and home-manager ####"
    echo "#### --                                                   ####"
    echo "#### Remember age keys.txt                                ####"
    echo "##############################################################"
  '';
}
