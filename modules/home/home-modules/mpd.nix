{
  self,
  inputs,
  ...
}: {
  flake.homeModules.mpd = {
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
    };
  };
}
