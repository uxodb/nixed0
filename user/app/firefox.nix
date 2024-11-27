{ config, pkgs, lib, xSettings, ... }: 

let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  inherit (xSettings) appConfig;
  inherit (config.home) homeDirectory;
in {

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "personal";
      isDefault = true;
      path = "personal";
    };
    policies = {
      DefaultDownloadDirectory = "${homeDirectory}/Downloads";
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
  home.file = {
    ".mozilla/firefox/personal/chrome" = {
      recursive = true;
      source = mkOutOfStoreSymlink "${appConfig}/firefox/personal/chrome";
    };
    ".mozilla/firefox/personal/user.js" = {
      source = mkOutOfStoreSymlink "${appConfig}/firefox/personal/user.js";
    };
  };

  xdg.configFile."firefox/" = {
    recursive = true;
    source = mkOutOfStoreSymlink "${homeDirectory}/.mozilla";
  };
}
