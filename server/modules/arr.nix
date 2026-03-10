{
  services = {
    radarr = {
      enable = true;
      server.port = 7878; 
    };
    sonarr = {
      enable = true;
      server.port = 8989;
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
}
