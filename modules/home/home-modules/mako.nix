{ self, inputs, ... }: {
  flake.homeModules.mako = { pkgs, lib, ... }: {
    services.mako = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myMako;
    };
  };
  perSystem = { pkgs, lib, ... }: {
    packages.myMako = inputs.wrapper-modules.wrappers.mako.wrap {
    inherit pkgs;
      settings = {
        sort = "-time";
        layer = "overlay";
        anchor = "top-left";
        default-timeout = 5000;
      };
    };
  };
}
