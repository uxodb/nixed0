{ config, pkgs, inputs, xSettings, ... }: {

  services.displayManager.sddm = {
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
}
