{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      curl
      dig
      gnupg
      htop
      jq
      just
      manix
      nh
      nix-health
      nix-init
      nix-melt
      nix-search-cli
      nurl
      pinentry-curses
      sops
      ssh-to-age
      tree
      unrar
      unzip
      wget
      ;
    #    astronaut = pkgs.callPackage ../pkgs/sddm-astronaut.nix {
    #     embeddedTheme = "pixel_sakura";
    #    };
  };

  # Failed to load/create freetype error
  # fc-cache -r
  fonts.packages = builtins.attrValues {
    inherit
      (pkgs.nerd-fonts)
      _0xproto
      fantasque-sans-mono
      fira-code
      fira-mono
      hack
      inconsolata
      jetbrains-mono
      roboto-mono
      ubuntu
      ubuntu-mono
      ;
    inherit
      (pkgs)
      corefonts
      font-awesome
      noto-fonts-color-emoji
      vista-fonts
      ;
  };
}
