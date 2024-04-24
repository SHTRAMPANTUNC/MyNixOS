{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxAccounts = true;
        PasswordManagerEnabled = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        SearchBar = "unified";
      };
    };
    profiles = {
      kuper = {
        name = "kuper";
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          vimium
          bitwarden
          sponsorblock
          ublock-origin
          simple-translate
          youtube-shorts-block
          pkgs.nur.repos.bandithedoge.firefoxAddons.material-icons-for-github
        ];
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {
          "general.smoothScroll" = true;
          "devtools.chrome.enabled" = true;
          "media.hardware-video-decoding.enabled" = true;
        };
        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("media.ffmpeg.vaapi.enabled", true);
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
