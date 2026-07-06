{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.pihole = {
    services.pihole-ftl = {
      enable = true;
      lists = [
        {
          url = "https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/adblock/pro.txt";
          type = "block";
          enabled = true;
          description = "Hagezi's Multi Pro";
        }
      ];
      openFirewallDNS = true;
      openFirewallDHCP = true;
      openFirewallWebserver = true;
      queryLogDeleter.enable = true;
      settings = {
        hosts = [
          "192.168.0.196 jellyfin.server.org"
        ];
        upstreams = ["1.1.1.1"];
      };
      ntp = {
        ipv4.active = false;
        ipv6.active = false;
        sync.active = false;
      };
    };

    pihole-web = {
      enable = true;
      ports = [80];
    };
    
    resolved = {
      settings = {
        Resolve = {
          DNSStubListener = false;
          MulticastDNS = false;
        };
      };
    };
    system.activationScripts = {
      print-pi-hole = {
        text = builtins.trace "building the pi-hole configuration..." "";
      };
    };
  };
}
