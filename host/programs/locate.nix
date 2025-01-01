{ config, pkgs, inputs, xSettings, ... }: {
  services.locate = {
    enable = true;
    package = pkgs.mlocate;
    interval = "never";
    localuser = null;
    # prunePaths = "";
  };
}
