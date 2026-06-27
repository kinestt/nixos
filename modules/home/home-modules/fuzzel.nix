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
          background = "282828ff";
          text = "ebdbb2ff";
          match = "fe8019ff";
          selection = "3c3836ff";
          selection-match = "fabd2fff";
          selection-text = "ebdbb2ff";
          border = "504945ff";
        };
      };
    };
  };
}
