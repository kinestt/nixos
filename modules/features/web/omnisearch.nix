{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.omnisearch = {
    services.omnisearch = {
      enable = true;
    };
  };
}
