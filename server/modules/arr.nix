{
  services = {
    radarr = {
      enable = true;
      settings = {
        server = {
          bindaddress = "*";
          port = 7878;
        };
      };
    };
    sonarr = {
      enable = true;
      settings = {
        server = {
          bindaddress = "*";
          port = 8989;
        };
      };
    };
    prowlarr = { 
      enable = true; 
      settings = { 
        server = { 
          bindaddress = "*";
          port = 9696;
        };
      };
    };
    qbittorrent = {
      enable = false;
      webuiPort = 8888;
      extraArgs = 
        [
          "--confirm-legal-notice"
        ];
      torrentingPort = 5555;
    };    
  };
    
  systemd.services = {
    radarr = {
      serviceConfig = {
        LoadCredential = [
          "radarr_api_key:/etc/secrets/radarr-api-key"
        ];
      };
    };
    sonarr = {
      serviceConfig = {
        LoadCredential = [
          "sonarr_api_key:/etc/secrets/sonarr-api-key"
        ];
      };
    };
  };
}
