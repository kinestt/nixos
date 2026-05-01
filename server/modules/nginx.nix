{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;

    virtualHosts = {
      "vault.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
      };
      "search.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
      };
      "rss.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9090";
          proxyWebsockets = true;
        };
      };
      "scrobble.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9078";
          proxyWebsockets = true;
        };
      };
      "piped.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7070";
          proxyWebsockets = true;
        };
      };
      "pipedapi.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7071";
          proxyWebsockets = true;
        };
      };
      "pipedproxy.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7072";
          proxyWebsockets = true;
        };
      };
      "jellyfin.peanutbutter.quest" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8096";
          proxyWebsockets = true;
        };
      };
    };
  };
  security.acme = {
    defaults.email = "clovertight@gmail.com";
    acceptTerms = true;
  };

  systemd.services.nginx.serviceConfig.ProtectHome = false;
}
