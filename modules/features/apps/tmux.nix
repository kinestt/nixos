{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.tmux = {
    pkgs,
    lib,
    ...
  }: { 
    programs.tmux = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myTmux;
    };
  };
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.myTmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;
      vimVisualKeys = true;
      sourceSensible = true;
    };
  };
}
