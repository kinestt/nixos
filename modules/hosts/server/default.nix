{
  withSystem,
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.server = inputs.nixpkgs-stable.lib.nixosSystem {
    modules = [
      self.nixosModules.serverConfiguration
    ];
  };
}
