{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.komga = {
    services.komga = {
      enable = true;
      settings = {
        server = {
          port = 10060;
        };
      };
    };
  };
}
