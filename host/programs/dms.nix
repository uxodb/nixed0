{configs, pkgs, inputs, xSettings, ...}: {

  programs.dank-material-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    # enableSystemMonitoring = true;
    # enableClipboard = true;
    # enableVPN = true;
    # enableDynamicTheming = true;
    # enableAudioWavelength = true;
    # enableCalendarEvents = true;
  };
}
