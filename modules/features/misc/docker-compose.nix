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
    # Runtime
    virtualisation.podman = {
        enable = true;
        autoPrune.enable = true;
        dockerCompat = true;
    };

    # Enable container name DNS for all Podman networks.
    networking.firewall.interfaces = let
        matchAll = if !config.networking.nftables.enable then "podman+" else "podman*";
    in {
        "${matchAll}".allowedUDPPorts = [ 53 ];
    };

    virtualisation.oci-containers.backend = "podman";

    # Containers
    virtualisation.oci-containers.containers."TFG" = {
        image = "itzg/minecraft-server:latest";
        environment = {
        "ENABLE_RCON" = "false";
        "EULA" = "true";
        "FORGE_VERSION" = "47.4.13";
        "GENERIC_PACKS" = "TerraFirmaGreg-Modern-0.12.8-serverpack";
        "GENERIC_PACKS_PREFIX" = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern/releases/download/0.12.8/";
        "GENERIC_PACKS_SUFFIX" = ".zip";
        "GUI" = "false";
        "MEMORY" = "6G";
        "OVERRIDE_SERVER_PROPERTIES" = "false";
        "SKIP_GENERIC_PACK_UPDATE_CHECK" = "true";
        "TYPE" = "forge";
        "VERSION" = "1.20.1";
        };
        volumes = [
        "/home/kin/data/minecraft/TFG:/data:rw"
        "/home/kin/data/minecraft/TFG/backups:/backups:rw"
        ];
        ports = [
        "6789:25565/tcp"
        "24454:24454/udp"
        ];
        log-driver = "journald";
        extraOptions = [
        "--network-alias=terrafirmagreg-modern"
        "--network=services_default"
        ];
    };
    systemd.services."podman-TFG" = {
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
        image = "localhost/compose2nix/services-fourget";
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

    # Builds
    systemd.services."podman-build-services-fourget" = {
        path = [ pkgs.podman pkgs.git ];
        serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        TimeoutSec = 300;
        };
        script = ''
        podman build -t compose2nix/services-fourget https://codeberg.org/kinest/4get.git
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
