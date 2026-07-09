{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.copyparty = {
    imports = [
      inputs.copyparty.nixosModules.default
    ];
    services.copyparty = {
      enable = true;
    };
  };
}
