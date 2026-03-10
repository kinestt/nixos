{
  services.nginx = {
    enable = true;
    virtualHosts = {
      "radarr.ricepaddle.site" = {
        enableACME = true; 
        forceSSL = true; 
        locations."/" = {
          proxyPass = "http://192.168.0.122:7878";
          proxyWebsockets = true;
        };
      };
    };
  };
  security.acme = {
    defaults.email = "tiredhames@gmail.com";
    acceptTerms = true; 
  };
}
