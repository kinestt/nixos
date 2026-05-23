{ withSystem, self, inputs, ... }: {
  flake.homeConfigurations.kin-lenovo = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.kinConfiguration
      ({ pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;
      })
    ];
  };
}
