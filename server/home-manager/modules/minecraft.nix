{ config, pkgs, inputs, ... }:

let
  viaversion = pkgs.fetchurl {
    url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaVersion/versions/5.7.2/PAPER/ViaVersion-5.7.2.jar";
    hash = "sha256-OI/MoCsKWJNtCSqd348reDi7XXzuV+IauzDgjb/r8mw=";
  };
  viabackwards = pkgs.fetchurl {
    url = "https://hangarcdn.papermc.io/plugins/ViaVersion/ViaBackwards/versions/5.7.2/PAPER/ViaBackwards-5.7.2.jar";
    hash = "sha256-8Vg8L1NP9UA6NGabxsUoSwToJtHb3WrT8glvWTxZvZw=";
  };
  geyser = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot";
    hash = "sha256-PSt+IRhn+SiJrxNSUJ/dQeKsqR4W/iP77zFeyOiMVSk=";
  };
  floodgate = pkgs.fetchurl {
    url = "https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot";
    hash = "sha256-LPTRZ+S+sU0xuyxewDZfgnd0dRLrC6f2vDHbyj2FCk4=";
  };
in {

  nixcraft = {
    enable = true;
    client.instances = { };
    server = {
      shared = {
        agreeToEula = true;
        serverProperties = {
          online-mode = false;
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
          serverProperties = {
            enable-rcon = true;
            rcon.port = 25575;
            rcon.password = "rconpassword";
          };
        };
      };
    };
  };
}
