{ config, pkgs, inputs, ... }:
let
  TFG = pkgs.fetchurl {
    url = "https://github.com/TerraFirmaGreg-Team/Modpack-Modern/releases/download/0.12.5/TerraFirmaGreg-Modern-0.12.5-modrinth.mrpack";
    hash = "sha256-v20hv5Qah5q8r7YfvZUZhxzoG+YkAbTggaXVVCk6AxA=";
  };
in {
  nixcraft = {
    enable = true;
    client.instances = { };
    server = {
      shared = {
        agreeToEula = true;
      };
      instances = {
        TFG-new = {
          enable = false;
          mrpack = {
            enable = true;
            file = TFG;
          };
          java.memory = 6000;
          service = {
            enable = true;
            autoStart = true;
          };
        };
      };
    };
  };
}


