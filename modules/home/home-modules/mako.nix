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
        font = "Iosevka Nerd Font Mono";
        layer = "overlay";
        anchor = "top-right";
        default-timeout = 5000;
        width = 300;
        height = 110;
        padding = "0,15,20";
        background-color = "#282828";

        "urgency=normal" = {
            border-color = "#458588"; # blue
        };

        "urgency=high" = {
            border-color = "#cc241d"; # red
            default-timeout = 0;
        };
      };
    };
  };
}
