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
              publicKey = "aE/U4NKAQf8R/eNh0oMziU5v7NyVIzef0Q2nlIyAUXU=";
              allowedIPs = [ "10.0.0.2/32" ];
            }
          ];
          postSetup = ''
            ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.0.0.1/24 -o eno1 -j MASQUERADE
          '';

      # Undo the above
          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.0.0.1/24 -o eno1 -j MASQUERADE
          '';
        };
      };
    };
  };
}
