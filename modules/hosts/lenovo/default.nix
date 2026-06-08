{
  withSystem,
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.lenovo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.lenovoConfiguration
      ({pkgs, ...}: {
        nixpkgs.config.allowUnfree = true;
        nixpkgs.overlays = [
        ];
      })
    ];
  };
}
