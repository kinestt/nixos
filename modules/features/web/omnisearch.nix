{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.omnisearch = {
    inputs = [
      inputs.omnisearch.nixosModules.default
    ];
    services.omnisearch = {
      enable = true;
    };
  };
}
