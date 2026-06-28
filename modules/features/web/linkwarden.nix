{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.linkwarden = {
    services.linkwarden = {
      enable = true;
    };
  };
}
