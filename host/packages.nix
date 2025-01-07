{ config,  inputs, xSettings, ... }: {

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
    sddm-astronaut
    sops
    just
    wget
    jq
    curl
    tree
    ssh-to-age
    unzip
    unrar
    nix-health
    nix-melt
    nix-search-cli
    manix
    nurl
    nh;
  };

  # Failed to load/create freetype error
  # fc-cache -r
  fonts.packages = builtins.attrValues {
    inherit (pkgs.nerd-fonts)
    fira-code
    fira-mono
    jetbrains-mono
    fantasque-sans-mono
    ubuntu-mono
    ubuntu
    _0xproto
    hack
    inconsolata
    roboto-mono;
    inherit (pkgs)
    corefonts
    vistafonts
    font-awesome
    noto-fonts-emoji;
  };
}
