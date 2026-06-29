{
  self,
  inputs,
  ...
}: {
  flake.homeModules.zen-browser = {
    pkgs,
    ...
  }: {
    imports = [
      inputs.zen-browser.homeModules.default 
    ];
    programs.zen-browser = {
      enable = true;
      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        SearchEngines = {
          Remove = [
            "Google"
            "Bing"
            "Perplexity"
          ];
        };
      };
      profiles = {
        default = {
          isDefault = true;
          id = 0;
          search = {
            force = true;
            default = "fourget";
            engines = {
              fourget = {
                name = "4get";
                urls = [
                  {
                    template = "https://4get.peanutbutter.quest/web?s={searchTerms}&scraper=google_cse&nsfw=yes";
                    params = [
                      {
                        name = "query";
                        value = "searchTerms";
                      }
                    ];
                  }
                ];
                definedAliases = ["@4g"];
              };
              searxng = {
                name = "searxng";
                urls = [
                  {
                    template = "https://search.peanutbutter.quest/search?q={searchTerms}";
                    params = [
                      {
                        name = "query";
                        value = "searchTerms";
                      }
                    ];
                  }
                ];
                definedAliases = ["sng"];
              };
            };
          };
          extensions = {
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              bitwarden
              sponsorblock
              violentmonkey
              floccus
            ];
          };
          settings = {
            "zen.workspaces.continue-where-left-off" = false;
          };
        };
      };
    };
  };
}
