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
      enable = true;
      webuiPort = 8888;
      extraArgs = 
        [
          "--confirm-legal-notice"
        ];
      torrentingPort = 5555;
    };
  };
  users.users.qbittorrent.extraGroups = [ "users" ];
  users.users.radarr.extraGroups = [ "users" ];    
  users.users.sonarr.extraGroups = [ "users" ];   
  systemd.services.qbittorrent = {
    serviceConfig = {
      UMask = "000";
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
