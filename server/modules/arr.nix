{ config, ... }: {
  services = {
#    radarr = {
#      enable = true;
#      settings = {
#        server = {
#          bindaddress = "*";
#          port = 7878;
#        };
#      };
#      environmentFiles = [
#        "${config.sops.secrets.radarr_api_env.path}"
#      ];
#    };
#    sonarr = {
#      enable = true;
#      settings = {
#        server = {
#          bindaddress = "*";
#          port = 8989;
#        };
#      };
#      environmentFiles = [
#        "${config.sops.secrets.sonarr_api_env.path}"
#      ];
#    };
#    prowlarr = { 
#      enable = true; 
#      settings = { 
#        server = { 
#          bindaddress = "*";
#          port = 9696;
#        };
#      };
#    }; 
#    lidarr = {
#      enable = true;
#      settings = {
#        server = {
#          bindaddress = "*";
#          port = 8686;
#        };
#      };
#      environmentFiles = [
#        "${config.sops.secrets.lidarr_api_env.path}"
#      ]; 
#    };
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
  systemd.services.qbittorrent = {
    serviceConfig = {
      UMask = "000";
    };
  };
}
