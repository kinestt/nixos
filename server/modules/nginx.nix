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
        locations."/" = {
          proxyPass = "http://192.168.0.122:7878";
          proxyWebsockets = true;

          extraConfig = "
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
         ";
        };
      };
    };
  };
  security.acme = {
    defaults.email = "tiredhames@gmail.com";
    acceptTerms = true; 
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
