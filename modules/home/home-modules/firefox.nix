{
  ...
}: {
  flake.homeModules.firefox = { 
    config,
    pkgs,
    lib,
    ...
  }: {
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      policies = {
        DNSOverHTTPS = {
          Enabled = true;
          ProviderURL = "https://freedns.controld.com/p0";
          Locked = true;
        };
        DisableFirefoxStudies = true;
        DisableFirefoxAccounts = true;
        DisableTelemetry = true;
        DisableFeedbackCommands = true;
        DisableSetDesktopBackground = true;
        FirefoxHome = {
          SponsoredStories = false;
          SponsoredTopSites = false;
          SponsoredPocket = false;
          Stories = false;
          Search = true;
          Shortcuts = false;
          TopSites = false;
          Highlights = false;
          Pocket = false;
          Snippets = false;
          Locked = true;
        };
        GenerativeAI = {
          Enabled = false;
        };
        SearchEngines = {
          Remove = [
            "Google"
            "Bing"
            "Perplexity"
          ];
          Default = "SearXNG";
          Add = [
            {
              Name = "SearXNG";
              Description = "A privacy-respecting, hackable metasearch engine";
              Alias = "sng";
              Method = "POST";
              URLTemplate = "https://search.peanutbutter.quest/search?q={searchTerms}";
            }
          ];
        };
      };
      profiles = {
        "betterfox" = {
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              bitwarden
            ];
            settings."uBlock0@raymondhill.net".settings = {
              selectedFilterLists = [
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-unbreak"
                "ublock-quick-fixes"
              ];
            };
          };
        };
      };
          
    };
  };
}
      

