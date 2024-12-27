{ config, pkgs, inputs, xSettings, ... }: {

  environment.systemPackages = [
    pkgs.sddm-astronaut
    pkgs.sops
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
    noto-fonts-emoji;
  };

  programs = {
    xwayland.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      #systemd.setPath.enable = "";

    };
    ssh = {
      startAgent = true;
    };
  };

  services = {
    xserver.enable = false;
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
    locate = {
      enable = true;
      package = pkgs.mlocate;
      interval = "never";
      # prunePaths = "";
    };
  };
}
