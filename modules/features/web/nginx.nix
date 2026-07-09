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
        "vault.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
        };
        "search.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
        };
        "4get.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10030";
            proxyWebsockets = true;
          };
        };
        "party.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:3923";
            proxyWebsockets = true;
          };
        };
        "omni.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:5000";
            proxyWebsockets = true;
          };
        };
        "jellyfin.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8096";
            proxyWebsockets = true;
          };
        };
        "piped.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10100";
            proxyWebsockets = true;
          };
        };
        "pipedapi.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10101";
            proxyWebsockets = true;
          };
        };
        "pipedproxy.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10102";
            proxyWebsockets = true;
          };
        };
        "linkwarden.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:3000";
            proxyWebsockets = true;
          };
        };
        "komga.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10060";
            proxyWebsockets = true;
          };
        };
        "radarr.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:7878";
            proxyWebsockets = true;
          };
        };
        "sonarr.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8989";
            proxyWebsockets = true;
          };
        };
        "prowlarr.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:9696";
            proxyWebsockets = true;
          };
        };
        "lidarr.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8686";
            proxyWebsockets = true;
          };
        };
        "qb.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:8888";
            proxyWebsockets = true;
          };
        };
        "redlib.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:5544";
            proxyWebsockets = true;
          };
        };
        "kitty.server.org" = {
          forceSSL = true;
          sslCertificate = "/etc/ssl/local/server.org.pem";
          sslCertificateKey = "/etc/ssl/local/server.org-key.pem";
          locations."/" = {
            proxyPass = "http://127.0.0.1:10200";
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
