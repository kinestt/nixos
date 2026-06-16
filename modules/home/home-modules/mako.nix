{
  self,
  inputs,
  ...
}: {
  flake.homeModules.mako = {
    pkgs,
    ...
  }: {
    services.mako = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myMako;
    };
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myMako = inputs.wrapper-modules.wrappers.mako.wrap {
      inherit pkgs;
      settings = {
        sort = "-time";
        font = "SF Pro";
        layer = "overlay";
        anchor = "top-right";
        default-timeout = 5000;
        width = 300;
        height = 110;
        padding = "0,15,20";
        background-color = "#191724";
        "urgency=normal" = {
          border-color = "#ebbcba";
        };
        "urgency=high" = {
          border-color = "#d7827e";
          default-timeout = 0;
        };
      };
    };
  };
}
