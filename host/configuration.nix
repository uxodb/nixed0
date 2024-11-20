{ config, pkgs, inputs, xSettings, ... }:

{
  imports = [ 
    ./hardware.nix
    ./packages.nix
    ./sops.nix
    inputs.ucodenix.nixosModules.default
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 15;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = xSettings.hostname;
    useNetworkd = true;
    #useDHCP = true;
    interfaces.eth0.useDHCP = true;
  };

  time.timeZone = xSettings.timezone;
  i18n = {
    defaultLocale = xSettings.locale;
    extraLocaleSettings = {
      LC_ADDRESS = xSettings.locale;
      LC_IDENTIFICATION = xSettings.locale;
      LC_MEASUREMENT = xSettings.locale;
      LC_MONETARY = xSettings.locale;
      LC_NAME = xSettings.locale;
      LC_NUMERIC = xSettings.locale;
      LC_PAPER = xSettings.locale;
      LC_TELEPHONE = xSettings.locale;
      LC_TIME = xSettings.locale;
    };
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

  users.users.${xSettings.username} = {
    isNormalUser = true;
    description = xSettings.username;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    uid = 1000;
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
