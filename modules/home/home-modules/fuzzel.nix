{
  self,
  inputs,
  ...
}: {
  flake.homeModules.fuzzel = {
    pkgs,
    ...
  }: {
    programs.fuzzel = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFuzzel;
    };
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myFuzzel = inputs.wrapper-modules.wrappers.fuzzel.wrap {
      inherit pkgs;
      settings = {
        main = {
          #font = "Futura:size=12";
        };
        colors = {
          background = "#191724b3";
          text = "#e0def4ff";
          prompt = "#e0def4ff";
          placeholder = "#6e6a86ff";
          input = "#e0def4ff";
          match = "#ebbcbaff";
          selection = "#403d52ff";
          selection-text = "#e0def4ff";
          selection-match = "#ebbcbaff";
          counter = "#f6c177ff";
          border = "#ebbcbaff";
        };
      };
    };
  };
}
