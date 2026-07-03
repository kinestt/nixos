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
        "vault.peanutbutter.quest" = {
          enableACME = true;
          forceSSL = true;
        };
        "search.peanutbutter.quest" = {
          enableACME = true;
          forceSSL = true;
        };
        "4get.peanutbutter.quest" = {
          enableACME = true;
          forceSSL = true;
          locations."/" = {
            proxyPass = "http://127.0.0.1:10030";
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
      };
    };
    security.acme = {
      defaults.email = "clovertight@gmail.com";
      acceptTerms = true;
    };

    systemd.services.nginx.serviceConfig.ProtectHome = false;

      #services.anubis.instances = {
      #  redlib = {
      #    enable = true;
      #    settings = {
      #      TARGET = "http://127.0.0.1:5544";
      #    };
      #  };
      #};
  };
}
