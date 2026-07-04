{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.omnisearch = inputs.omnisearch.nixosModules.default {
    services.omnisearch = {
      enable = true;
    };
  };
}
