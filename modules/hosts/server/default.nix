{ withSystem, self, inputs, ... }: {
  flake.nixosConfiguration.server = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.serverConfiguration
    ];
  };
}
