{ lib, ... }:
{
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "ja_JP.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  location.provider = "geoclue2";
  time.timeZone = "America/Los_Angeles";
}
