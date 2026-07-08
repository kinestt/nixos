{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.docker = {
    pkgs,
    lib,
    config,
    ...
  }: {
    sops.secrets = {
      "invidious/hmac_key" = {};
      "invidious/invidious_companion_key" = {};
    };
    # Runtime
    virtualisation.podman = {
        enable = true;
        autoPrune.enable = true;
    };

    # Enable container name DNS for all Podman networks.
    networking.firewall.interfaces = let
        matchAll = if !config.networking.nftables.enable then "podman+" else "podman*";
    in {
        "${matchAll}".allowedUDPPorts = [ 53 ];
    };

    virtualisation.oci-containers.backend = "podman";

    # Containers
    virtualisation.oci-containers.containers."multi-scrobbler" = {
        image = "foxxmd/multi-scrobbler:latest";
        environment = {
        "BASE_URL" = "http://192.168.0.122:9078";
        "PGID" = "100";
        "PUID" = "1000";
        "TZ" = "Asia/Kolkata";
        };
        volumes = [
        "/home/kin/data/multi-scrobbler/config:/config:rw"
        ];
        ports = [
        "9078:9078/tcp"
        ];
        log-driver = "journald";
        extraOptions = [
        "--network-alias=multi-scrobbler"
        "--network=services_default"
        ];
    };
    systemd.services."podman-multi-scrobbler" = {
        serviceConfig = {
        Restart = lib.mkOverride 90 "always";
        };
        after = [
        "podman-network-services_default.service"
        ];
        requires = [
        "podman-network-services_default.service"
        ];
        partOf = [
        "podman-compose-services-root.target"
        ];
        wantedBy = [
        "podman-compose-services-root.target"
        ];
    };
    virtualisation.oci-containers.containers."recyclarr" = {
        image = "ghcr.io/recyclarr/recyclarr:8";
        environment = {
        "PGID" = "100";
        "PUID" = "1000";
        "TZ" = "Asia/Kolkata";
        };
        volumes = [
        "/home/kin/data/recyclarr:/config:rw"
        ];
        log-driver = "journald";
        extraOptions = [
        "--network-alias=recyclarr"
        "--network=services_default"
        ];
    };
    systemd.services."podman-recyclarr" = {
        serviceConfig = {
        Restart = lib.mkOverride 90 "no";
        };
        after = [
        "podman-network-services_default.service"
        ];
        requires = [
        "podman-network-services_default.service"
        ];
        partOf = [
        "podman-compose-services-root.target"
        ];
        wantedBy = [
        "podman-compose-services-root.target"
        ];
    };
    virtualisation.oci-containers.containers."services-fourget" = {
        image = "luuul/4get:latest";
        environment = {
        "FOURGET_PROTO" = "http";
        "FOURGET_SERVER_NAME" = "4get.peanutbutter.quest";
        };
        ports = [
        "10030:80/tcp"
        ];
        log-driver = "journald";
        extraOptions = [
        "--network-alias=fourget"
        "--network=services_default"
        ];
    };
    systemd.services."podman-services-fourget" = {
        serviceConfig = {
        Restart = lib.mkOverride 90 "always";
        };
        after = [
        "podman-build-services-fourget.service"
        "podman-network-services_default.service"
        ];
        requires = [
        "podman-build-services-fourget.service"
        "podman-network-services_default.service"
        ];
        partOf = [
        "podman-compose-services-root.target"
        ];
        wantedBy = [
        "podman-compose-services-root.target"
        ];
    };

    virtualisation.oci-containers.containers."services-invidious" = {
      image = "quay.io/invidious/invidious:latest";
      environment = {
        "INVIDIOUS_CONFIG" = "db:
      dbname: invidious
      user: kemal
      password: kemal
      host: invidious-db
      port: 5432
    check_tables: true
    invidious_companion:
    # URL used for the internal communication between invidious and invidious companion
    # There is no need to change that except if Invidious companion does not run on the same docker compose file.
    - private_url: \"http://companion:8282/companion\"
    # IT is NOT recommended to use the same key as HMAC KEY. Generate a new key!
    # Use the key generated in the 2nd step
    #invidious_companion_key: \"CHANGE_ME!!\"
    # external_port:
    # domain:
    # https_only: false
    # statistics_enabled: false
    # Use the key generated in the 1st step
    #hmac_key: \"CHANGE_ME!!\"
    ";
        "port" = "3001";
      };
      environmentFiles = [
        config.sops.secrets."invidious/hmac_key".path
        config.sops.secrets."invidious/invidious_companion_key".path
      ];
      ports = [
        "3001:3001/tcp"
      ];
      labels = {
        "compose2nix.settings.sops.secrets" = "invidious/hmac_key,invidious/invidious_companion_key";
      };
      dependsOn = [
        "services-invidious-db"
      ];
      extraOptions = [
        "--health-cmd=wget -nv --tries=1 --spider http://127.0.0.1:3001/api/v1/stats || exit 1"
        "--health-interval=30s"
        "--health-retries=2"
        "--health-timeout=5s"
        "--log-opt=max-file=4"
        "--log-opt=max-size=1G"
        "--network-alias=invidious"
        "--network=services_default"
      ];
    };
    systemd.services."podman-services-invidious" = {
      serviceConfig = {
        Restart = lib.mkOverride 90 "always";
      };
      after = [
        "podman-network-services_default.service"
      ];
      requires = [
        "podman-network-services_default.service"
      ];
      partOf = [
        "podman-compose-services-root.target"
      ];
      wantedBy = [
        "podman-compose-services-root.target"
      ];
    };
    virtualisation.oci-containers.containers."services-invidious-db" = {
      image = "docker.io/library/postgres:14";
      environment = {
        "POSTGRES_DB" = "invidious";
        "POSTGRES_PASSWORD" = "kemal";
        "POSTGRES_USER" = "kemal";
      };
      volumes = [
        "${builtins.toString inputs.invidious}/config/sql:/config/sql:rw"
        "${builtins.toString inputs.invidious}/docker/init-invidious-db.sh:/docker-entrypoint-initdb.d/init-invidious-db.sh:rw"
        "services_postgresdata:/var/lib/postgresql/data:rw"
      ];
      log-driver = "journald";
      extraOptions = [
        "--health-cmd=pg_isready -U $POSTGRES_USER -d $POSTGRES_DB"
        "--network-alias=invidious-db"
        "--network=services_default"
      ];
    };
    systemd.services."podman-services-invidious-db" = {
      serviceConfig = {
        Restart = lib.mkOverride 90 "always";
      };
      after = [
        "podman-network-services_default.service"
        "podman-volume-services_postgresdata.service"
      ];
      requires = [
        "podman-network-services_default.service"
        "podman-volume-services_postgresdata.service"
      ];
      partOf = [
        "podman-compose-services-root.target"
      ];
      wantedBy = [
        "podman-compose-services-root.target"
      ];
    };


    # Volumes
    systemd.services."podman-volume-services_companioncache" = {
      path = [ pkgs.podman ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        podman volume inspect services_companioncache || podman volume create services_companioncache
      '';
      partOf = [ "podman-compose-services-root.target" ];
      wantedBy = [ "podman-compose-services-root.target" ];
    };
    systemd.services."podman-volume-services_postgresdata" = {
      path = [ pkgs.podman ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
      };
      script = ''
        podman volume inspect services_postgresdata || podman volume create services_postgresdata
      '';
      partOf = [ "podman-compose-services-root.target" ];
      wantedBy = [ "podman-compose-services-root.target" ];
    };

    # Networks
    systemd.services."podman-network-services_default" = {
        path = [ pkgs.podman ];
        serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStop = "podman network rm -f services_default";
        };
        script = ''
        podman network inspect services_default || podman network create services_default
        '';
        partOf = [ "podman-compose-services-root.target" ];
        wantedBy = [ "podman-compose-services-root.target" ];
    };

    # Root service
    # When started, this will automatically create all resources and start
    # the containers. When stopped, this will teardown all resources.
    systemd.targets."podman-compose-services-root" = {
        unitConfig = {
        Description = "Root target generated by compose2nix.";
        };
        wantedBy = [ "multi-user.target" ];
    };
  };
}
