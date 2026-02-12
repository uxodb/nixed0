{ config, pkgs, inputs, ... }: {
  services.solaar = {
    enable = true;
    package = inputs.solaar.packages.${pkgs.stdenv.hostPlatform.system}.default;
    window = "hide";
    batteryIcons = "regular";
    extraArgs = "";
  };
}
