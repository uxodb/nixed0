{ config, pkgs, lib, xSettings, ... }: {

  programs.firefox = with config; {
    enable = true;
    profiles.default = {
      id = 0;
      name = "personal";
      isDefault = true;
      path = "personal";
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
  home.file = with xSettings; {
    ".mozilla/firefox/personal/chrome" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/firefox/personal/chrome";
    };
    ".mozilla/firefox/personal/user.js" = {
      source = config.lib.file.mkOutOfStoreSymlink "${appConfig}/firefox/personal/user.js";
    };
  };

  xdg.configFile."firefox/" = with config; {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${home.homeDirectory}/.mozilla";
  };
}
