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
        anchor = "top-right";
        default-timeout = 5000;
        width = 300;
        height = 110;
        padding = "0,15,20";
        background-color = "#1a1b26";
        "urgency=normal" = {
          border-color = "#7aa2f7";
        };
        "urgency=high" = {
          border-color = "#f7768e";
          default-timeout = 0;
        };
      };
    };
  };
}
