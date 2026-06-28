{
  ...
}: {
  flake.homeModules.firefox = { 
    config,
    pkgs,
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
        ShowHomeButton = true;
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
          Default = "4get";
          Add = [
            {
              Name = "SearXNG";
              Description = "A privacy-respecting, hackable metasearch engine";
              Alias = "sng";
              Method = "POST";
              URLTemplate = "https://search.peanutbutter.quest/search?q={searchTerms}";
            }
            {
              Name = "Searchix";
              Description = "NixOS Module/Option search";
              Alias = "six";
              Method = "POST";
              URLTemplate = "https://searchix.ovh?query={searchTerms}";
            }
            {
              Name = "4get";
              Description = "4get is a proxy search engine that doesn't suck";
              Alias = "4g";
              Method = "POST";
              URLTemplate = "https://4get.peanutbutter.quest/web?s={searchTerms}&scraper=google_cse&nsfw=yes";
            }
          ];
        };
      };
      profiles = {
        standard = {
          id = 0;
          name = "standard";
          isDefault = true;
          extensions = {
            force = true;
            packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              bitwarden
              sponsorblock
              violentmonkey
            ];
          };
          settings = {
            "signon.formlessCapture.enabled" = false;
            "signon.privateBrowsingCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "editor.truncate_user_pastes" = false;
          };
        };
      };
    };
  };
}
