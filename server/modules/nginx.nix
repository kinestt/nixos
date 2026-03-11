{
  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    
    virtualHosts = {
      "radarr.ricepaddle.site" = {
        enableACME = true; 
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:7878";
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
