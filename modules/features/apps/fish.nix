{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.fish = {
    pkgs,
    ...
  }: {
    programs.fish = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myFish;
    };
  };
  perSystem = {
    pkgs,
    config,
    lib,
    ...
  }: let 
    nixosDir = "/home/$USER/nixos/";
  in { 
    packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
      inherit pkgs;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ${nixosDir}#$hostname";
        hms = "home-manager switch --flake ${nixosDir}#$USER-$hostname";
        y = "yazi";
        l = "${lib.getExe pkgs.lsd} -l";
        la = "${lib.getExe pkgs.lsd} -a";
        lla = "${lib.getExe pkgs.lsd} -la";
        lt = "${lib.getExe pkgs.lsd} --tree";
      };
      plugins = with pkgs.fishPlugins; [
        pure
      ];
    };
  };
}
