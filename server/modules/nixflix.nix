{ config, ... }: {
  sops.secrets = {
    "radarr/api_key" = {};
    "radarr/username" = {};
    "radarr/password" = {};
    "sonarr/api_key" = {};
    "sonarr/username" = {};
    "sonarr/password" = {};
    "prowlarr/api_key" = {};
    "prowlarr/username" = {};
    "prowlarr/password" = {};
    "lidarr/api_key" = {};
    "lidarr/username" = {};
    "lidarr/password" = {};
    "qbittorrent/username" = {};
    "qbittorrent/password" = {};
    "jellyfin/api_key" = {};
    "jellyfin/users/kin/password" = {};
    "jellyfin/users/priyaa/password" = {};
    "jellyfin/users/nattsu/password" = {};
  };

  nixflix = {
    enable = true;
    mediaDir = "/mnt/external-hdd/stream";
    stateDir = "/data/.state";
    mediaUsers = [ "users" ];

    postgres.enable = false;
    
    downloadarr = {
      enable = true;
      qbittorrent = {
        enable = true;
        host = "127.0.0.1";
        username = config.sops.secrets."qbittorrent/username".path;
        password._secret = config.sops.secrets."qbittorrent/password".path;
        port = 8888;

        categories = {
          lidarr = "lidarr";
          radarr = "radarr";
        };
      };
    };

    lidarr = {
      enable = true;
      mediaDirs = [
        "${config.nixflix.mediaDir}/music"
      ];
      config = {
        apiKey._secret = config.sops.secrets."lidarr/api_key".path;
        hostConfig = {
          username._secret = config.sops.secrets."lidarr/username".path;
          password._secret = config.sops.secrets."lidarr/password".path;
        };
      };
      settings = {
        server = {
          port = 8686;
          bindaddress = "*";
        };
      };
    };

    radarr = {
      enable = true;
      mediaDirs = [
        "${config.nixflix.mediaDir}/movies"
      ];
      config = {
        apiKey._secret = config.sops.secrets."radarr/api_key".path;
        hostConfig = {
          username._secret = config.sops.secrets."radarr/username".path;
          password._secret = config.sops.secrets."radarr/password".path;
        };
      };
      settings = {
        server = {
          port = 7878;
          bindaddress = "*";
        };
      };
    };

    sonarr = {
      enable = true;
      mediaDirs = [
        "${config.nixflix.mediaDir}/tv"
      ];
      config = {
        apiKey._secret = config.sops.secrets."sonarr/api_key".path;
        hostConfig = {
          username._secret = config.sops.secrets."sonarr/username".path;
          password._secret = config.sops.secrets."sonarr/password".path;
        };
      };
      settings = {
        server = {
          port = 8989;
          bindaddress = "*";
        };
      };
    };

    jellyfin = {
      enable = true;
      apiKey._secret = config.sops.secrets."jellyfin/api_key".path;
      users = {
        kin = {
          password._secret = config.sops.secrets."jellyfin/users/kin/password".path;
          policy = {
            isAdministrator = true;
          };
        };
        priyaa = {
          password._secret = config.sops.secrets."jellyfin/users/priyaa/password".path;
        };
        nattsu = {
          password._secret = config.sops.secrets."jellyfin/users/nattsu/password".path;
        };
      };
    };
  };
}
