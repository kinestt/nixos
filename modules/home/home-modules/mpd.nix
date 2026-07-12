{
  self,
  inputs,
  ...
}: {
  flake.homeModules.mpd = {
    config,
    lib,
    ...
  }: {

    sops.secrets = {
      "last.fm/password" = {};
    };
    
    services = {
      mpd = {
        enable = true;
        network.port = 6600;
        musicDirectory = "/home/kin/audio";
        extraConfig = ''
          audio_output {
            type "pulse"
            name "Pipewire"
            mixer_type "hardware"
            mixer_device "default"
            mixer_control "PCM"
            mixer_index "0"
          }
        '';
      };
      mpdris2 = {
        enable = true;
        notifications = true;
      };
      mpd-discord-rpc = {
        enable = true;
        settings = {
          format = {
            details = "$title";
            state = "$artist";
          };
          hosts = [
            "127.0.0.1:6600"
          ];
        };
      };
      mpdscribble = {
        enable = true;
        endpoints = {
          "last.fm" = {
            username = "cementsediment";
            passwordFile = config.sops.secrets."last.fm/password".path;
          };
        };
      };
    };
  };
}
