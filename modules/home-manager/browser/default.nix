{ pkgs
, inputs
, ...
}:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
    };
    profiles = {
      kuper = {
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          vimium
          bitwarden
          sponsorblock
          ublock-origin
          simple-translate
          youtube-shorts-block
        ];
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {
          "general.smoothScroll" = true;
        };
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        '';
        userChrome = ''
          * {
              font-family: "JetBrainsMono Nerd Font", sans-serif !important;
              font-size: 18px !important;
          }
        '';
      };
    };
  };
}
