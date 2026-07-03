{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nginx = {
    config,
    ...
  }: {
    services.nginx = {
      enable = true;

      recommendedGzipSettings = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;

      virtualHosts = {
        "vault.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
        };
        "search.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
        };
        "4get.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10030";
            proxyWebsockets = true;
          };
        };
        "jellyfin.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8096";
            proxyWebsockets = true;
          };
        };
        "linkwarden.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
            proxyWebsockets = true;
          };
        };
        "komga.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10060";
            proxyWebsockets = true;
          };
        };
        "radarr.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:7878";
            proxyWebsockets = true;
          };
        };
        "sonarr.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8989";
            proxyWebsockets = true;
          };
        };
        "prowlarr.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:9696";
            proxyWebsockets = true;
          };
        };
        "lidarr.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8686";
            proxyWebsockets = true;
          };
        };
        "qb.server.lan" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server-lan.pem";
          sslCertificateKey = "/etc/ssl/local/server-lan-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8888";
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
  };
}
