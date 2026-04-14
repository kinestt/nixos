{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;

    virtualHosts = {
      "vault.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
      };
      "piped.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7070";
          proxyWebsockets = true;
        };
      };
      "pipedapi.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7071";
          proxyWebsockets = true;
        };
      };
      "pipedproxy.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7072";
          proxyWebsockets = true;
        };
      };
      "jellyfin.ricepaddle.site" = {
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
