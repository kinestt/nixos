{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.komga = {
    services.komga = {
      enable = true;
      user = "media";
      group = "media";
      settings = {
        server = {
          port = 10060;
        };
      };
    };
  };
}
