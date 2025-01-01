{ config, pkgs, inputs, xSettings, ... }: {

  environment.systemPackages = [
    pkgs.sddm-astronaut
    pkgs.sops
    pkgs.just
    #kdePackages.qt5compat
    #(qt6.callPackage ../../nixpkgs/sddmThemes/sddm-astronaut-theme.nix {})
  ];

  # Failed to load/create freetype error
  # fc-cache -r
  fonts.packages = builtins.attrValues {
    inherit (pkgs.nerd-fonts)
    fira-code
    jetbrains-mono
    fantasque-sans-mono
    ubuntu-mono
    ubuntu
    roboto-mono;
    inherit (pkgs)
    font-awesome
    noto-fonts-emoji;
  };
}
