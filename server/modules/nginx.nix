{
  services.nginx = {
    enable = true;
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
}
