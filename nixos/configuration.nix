{ config, pkgs, inputs, xSettings, ... }:
let
  inherit (xSettings) locale hostname username timezone;
in {
  imports = [ 
    ./services
    ./hardware.nix
    ./packages.nix
    ./sops.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    preallocate-contents = true;
    # keep-going = true;
    # sync-before-registering = true;
    # use-xdg-base-directories = true;
    # substituters = ["https://hyprland.cachix.org" "https://cosmic.cachix.org"];
    # trusted-public-keys = [
    #   "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    #   "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    # ];
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  catppuccin.grub.enable = true;

  networking = {
    hostName = hostname;
  };

  time.timeZone = timezone;
  time.hardwareClockInLocalTime = true;
  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    MOZ_ENABLE_WAYLAND = 1;
  };
  hardware = {
    ckb-next.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    uid = 1000;
    hashedPasswordFile = config.sops.secrets.userpasswd.path;
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
