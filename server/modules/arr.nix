{
  services = {
    radarr = {
      enable = true;  
    };
    sonarr = {
      enable = true;
    };
    qbittorrent = {
      enable = true;
      extraArgs = 
        [
          "--confirm-legal-notice"
        ];
      torrentingPort = "5555";
    };    
  };
}
