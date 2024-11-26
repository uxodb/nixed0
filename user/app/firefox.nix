{ config, pkgs, lib, xSettings, ... }: {

  programs.firefox = with config; {
    enable = true;
    profiles.default = {
      id = 0;
      name = "personal";
      isDefault = true;
      path = "${xdg.configHome}/firefox/personal/";
    };
    policies = {
      DefaultDownloadDirectory = "${home.homeDirectory}/Downloads";
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
