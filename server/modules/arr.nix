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
    recyclarr = {
      enable = true;
      configuration = {
        radarr = [
          {
            api_key = {
              _secret = "/run/credentials/recyclarr.service/radarr-api-key";
            };
            base_url = "http://localhost:7878";
            instance_name = "main";
            quality_definition = {
              type = "movie";
            };
            quality_profiles = [
              {
                trash_id = "d1d67249d3890e49bc12e275d989a7e9"; # HD Bluray + WEB
                reset_unmatched_scores = {
                  enabled = true;
                };
              }
            ];
            custom_format_groups = {
              add = [
                {
                  trash_id = "f8bf8eab4617f12dfdbd16303d8da245"; # Golden Rule HD
                  select = [
                    "dc98083864ea246d05a42df0d05f81cc" # x265 (HD)
                  ];
                }
              ];
              skip = [
                # "d9cc9a504e5ede6294c8b973aad4f028" # Streaming Services General (disabled if uncommented)
              ];
            };
          }
        ];
        sonarr = [
          {
            api_key = {
              _secret = "/run/credentials/recyclarr.service/sonarr-api-key";
            };
            base_url = "http://localhost:8989";
            instance_name = "anime";
          }
        ];
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
    recyclarr = {
      serviceConfig = {
        LoadCredential = [
          "sonarr_api_key:/etc/secrets/sonarr-api-key"
          "radarr_api_key:/etc/secrets/radarr-api-key"
        ];
      };
    };
  };
}
