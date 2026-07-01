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
      "wireguard/privatekey" = {};
    };

    networking.firewall.allowedUDPPorts = [ 51820 ];
    
    networking.wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          ips = [ "10.100.0.2/24" ];
          listenPort = 51820;
          privateKeyFile = config.sops.secrets."wireguard/privatekey".path;
          peers = [
            {
              name = "op13";
              publicKey = "YJSmpyuD9hdgh4sieucEJI73r0g+BtdofetE0GOrnQk=";
              allowedIPs = [ "10.100.0.0/24" ];
              endpoint = "192.168.0.122:51820";
              persistentKeepalive = 25;
            }
          ];
        };
      };
    };
  };
}
