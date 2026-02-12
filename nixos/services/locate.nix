{
  config,
  pkgs,
  inputs,
  xSettings,
  ...
}: {
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    interval = "never";
    # prunePaths = "";
  };
}
