{
  services = {
    radarr = {
      enable = true;
      settings = {
        server = {
          bindaddress = "*";
          port = 7878;
          urlbase = "radarr";
        };
      };
    };
    sonarr = {
      enable = true;
      settings = {
        server = {
          bindaddress = "*";
          port = 8989;
          urlbase = "sonarr";
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
}
