{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  services.displayManager.sddm = {
    enable = false;
    package = pkgs.kdePackages.sddm;
    extraPackages = [
      pkgs.kdePackages.qtvirtualkeyboard
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
    ];
    #    theme = "sddm-astronaut-theme";
    wayland.enable = true;
    settings = {
      General = {
        DefaultSession = "niri.desktop";
      };
    };
  };
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configFiles = ["/home/uxodb/.config/DankMaterialShell/settings.json"];
    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
}
