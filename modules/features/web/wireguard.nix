{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.wireguard = {
    config,
    ...
  }: {
    sops.secrets = {
      "wireguard/privatekey" = {
        mode = "640";
        owner = "systemd-network";
        group = "systemd-network";
      };
      "wireguard/publickeys/op13" = {
        mode = "640";
        owner = "systemd-network";
        group = "systemd-network";
      };
    };

    networking.useNetworkd = true;

    systemd.network = {
      enable = true;
      networks."50-wg0" = {
        matchConfig.Name = "wg0";
        address = [
          "fd31:bf08:57cb::7/128"
          "192.168.26.7/32"
        ];
      };

      netdevs."50-wg0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg0";
        };

        wireguardConfig = {
          ListenPort = 51820;
          PrivateKeyFile = config.sops.secrets."wireguard/privatekey".path;
          RouteTable = "main";
          FirewallMark = 42;
        };

        wireguardPeers = [
          {
            #OnePlus 13
            PublicKey = "aE/U4NKAQf8R/eNh0oMziU5v7NyVIzef0Q2nlIyAUXU=";
            AllowedIPs = [
              "192.168.26.9/32"
            ];
            Endpoint = "192.168.0.122:51820";
          }
        ];
      };
    };
  };
}
