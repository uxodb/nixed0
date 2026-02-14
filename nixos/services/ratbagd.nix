{ config, pkgs, inputs, ... }: {
  services.ratbagd = {
    enable = true;
    package = pkgs.libratbag;
  };
}
