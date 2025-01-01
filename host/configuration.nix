{ config, pkgs, inputs, xSettings, ... }:
let
  inherit (xSettings) locale hostname username timezone;
in {
  imports = [ 
    ./programs
    ./hardware.nix
    ./packages.nix
    ./sops.nix
  ];
  
  #######################
  #######################
  ####### Hyper-V #######
  ###########################################################
  ###########################################################
  virtualisation.hypervGuest.enable = true;               ###
  boot.blacklistedKernelModules = [ "hyperv_fb" ];        ###
  #boot.initrd.kernelModules = ["hv_vmbus" "hv_storvsc"]; ###
  boot.kernelParams = ["video=hyperv_fb:1920x1080"];      ###
  boot.kernel.sysctl."vm.overcommit_memory" = "1";        ###
  ###########################################################
  ###########################################################

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  boot.loader = {
    # systemd-boot
    # systemd-boot.enable = true;
    # systemd-boot.configurationLimit = 15;
    efi.canTouchEfiVariables = true;
    # grub
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
    useNetworkd = true;
    #useDHCP = true;
    interfaces.eth0.useDHCP = true;
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
    amdgpu.amdvlk.enable = true;
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
