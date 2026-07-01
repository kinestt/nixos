{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.wireguard = {
    config,
    pkgs,
    ...
  }: {
    sops.secrets = {
      "wireguard/privatekey" = {};
    };

    networking.firewall.allowedUDPPorts = [ 51820 ];

    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };   

    networking.nat = {
      enable = true;
      externalInterface = "eno1";
      internalInterfaces = [ "wg0" ];
    };

    networking.wireguard = {
      enable = true;

      interfaces = {
        wg0 = {
          ips = [ "10.0.0.1/24" ];
          listenPort = 51820;
          privateKeyFile = config.sops.secrets."wireguard/privatekey".path;

          peers = [
            {
              publicKey = "YJSmpyuD9hdgh4sieucEJI73r0g+BtdofetE0GOrnQk=";
              allowedIPs = [ "10.0.0.2/32" ];
            }
          ];
        };
      };
    };
  };
}
