{ config, pkgs, inputs, ... }:

let
  viaversion = pkgs.fetchurl {
    url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.7.2/PAPER/ViaVersion-5.7.2.jar";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  viabackwards = pkgs.fetchurl {
    url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.7.2/PAPER/ViaBackwards-5.7.2.jar";
    hash = "sha256-BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=";
  };

  geyser = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
    hash = "sha256-CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC=";
  };

  floodgate = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
    hash = "sha256-DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD=";
  };

in {

  nixcraft = {
    enable = true;
    client.enable = false;
    server = {
      shared = {
        agreeToEula = true;

        serverProperties = {
          online-mode = false; # required for Floodgate
          difficulty = "normal";
          max-players = 20;
        };

        binEntry.enable = true;
      };

      instances = {

        survival = {
          enable = true;

          version = "1.21.1";

          paper.enable = true;

          java.memory = 4096;

          service = {
            enable = true;
            autoStart = true;
          };

          files = {

            # protocol compatibility
            "plugins/ViaVersion.jar".source = viaversion;
            "plugins/ViaBackwards.jar".source = viabackwards;

            # bedrock support
            "plugins/Geyser-Spigot.jar".source = geyser;
            "plugins/Floodgate-Spigot.jar".source = floodgate;

          };
        };

      };
    };
  };
}
