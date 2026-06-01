{ self, inputs, ... }: {
  flake.homeModules.alacritty = { pkgs, lib, ... }: {
    programs.alacritty = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myAlacritty;
    };
  };
  perSystem = { pkgs, lib, ... }: {
    packages.myAlacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
    inherit pkgs;
      settings = {
        window = {
          opacity = 0.5;
        };
      };
    };
  };
} 
