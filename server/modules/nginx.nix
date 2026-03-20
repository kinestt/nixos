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
      "radarr.ricepaddle.site" = {
        enableACME = true; 
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7878";
          proxyWebsockets = true;
        };
      };
      
      "sonarr.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8989";
          proxyWebsockets = true;
        };
      };

      "qb.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8888";
          proxyWebsockets = true;
        };
      };
      "prowlarr.ricepaddle.site" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9696";
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
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
