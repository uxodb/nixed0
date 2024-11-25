{ config, pkgs, lib, xSettings, ... }: {

  programs.firefox = with xSettings; {
    enable = true;
    profiles.default = {
      id = 0;
      name = "personal";
      isDefault = true;
      path = "~/.config/firefox/personal";
    };
    policies = {
      DefaultDownloadDirectory = "/home/${username}/downloads";
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      DisableTelemetry = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      CaptivePortal = false;
      AppAutoUpdate = false;
      UserMessaging = {
        SkipOnboarding = true;
	MoreFromMozilla = false;
	FirefoxLabs = false;
	UrlbarInterventions = false;
	FeatureRecommendations = false;
	ExtensionRecommendations = false;
      };
    };
  };
  xdg.configFile."firefox/" = with xSettings; {
    source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/firefox";
  };

}
