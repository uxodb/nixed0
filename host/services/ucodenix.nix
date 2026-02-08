{ config, pkgs, inputs, xSettings, ... }: {

  services.ucodenix = {
    enable = true;
    cpuModelId = "00870F10";
  };
}
