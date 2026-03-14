{
  services.recyclarr = {
    enable = true;

    configuration = {
      radarr = {
        movies = {
          base_url = "http://localhost:7878";
          api_key._secret = "/run/credentials/recyclarr.service/radarr";
          quality_definition.type = "movie";

          quality_profiles = [
            {
              trash_id = "d1d67249d3890e49bc12e275d989a7e9";
              reset_unmatched_scores.enabled = true;
            }
          ];
        };
      };

      sonarr = {
        anime = {
          base_url = "http://localhost:8989";
          api_key._secret = "/run/credentials/recyclarr.service/sonarr";
          quality_definition.type = "anime";
        };
      };
    };
  };

  systemd.services.recyclarr.serviceConfig.LoadCredential = [
    "radarr:/etc/secrets/radarr-api-key"
    "sonarr:/etc/secrets/sonarr-api-key"
  ];

  systemd.timers.recyclarr = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };
}
