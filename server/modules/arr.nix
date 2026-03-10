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
      dataDir = "/home/kin/nixos/server/modules/data/radarr"; 
    };
    sonarr = {
      enable = true;
      settings = {
        server.port = 8989;
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
