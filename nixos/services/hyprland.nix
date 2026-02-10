{configs, pkgs, inputs, xSettings, ...}: {

  programs.hyprland = {
    enable = false;
    package =
      inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}
