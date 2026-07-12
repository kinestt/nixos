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
            default = "searxng";
            engines = {
              searxng = {
                name = "searxng";
                urls = [
                  {
                    template = "https://search.server.org/search?q={searchTerms}";
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
