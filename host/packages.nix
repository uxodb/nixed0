{ config, pkgs, inputs, xSettings, ... }:

{

  environment.systemPackages = with pkgs; [
    sddm-astronaut
    sops
    #kdePackages.qt5compat
    #(qt6.callPackage ../../nixpkgs/sddmThemes/sddm-astronaut-theme.nix {})
  ];

  programs = {
    xwayland.enable = true;
    zsh.enable = true;
    # hyprland = {
    #   enable = true;
    #   #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #   #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    #   #systemd.setPath.enable = "";
    #
    # };
    ssh = {
      startAgent = true;
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
       extraPackages = [pkgs.kdePackages.qt5compat];
      theme = "sddm-astronaut-theme";
      wayland.enable = true;
      settings = {
        General = {
	  DefaultSession = "hyprland.desktop";
	};
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    ucodenix = {
      enable = true;
      cpuModelId = "00870F10";
    };
  };
}
