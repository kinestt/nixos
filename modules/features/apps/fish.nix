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
    ...
  }: let 
    nixosDir = "/home/kin/nixos/";
  in { 
    packages.myFish = inputs.wrapper-modules.wrappers.fish.wrap {
      inherit pkgs;
      abbreviations = {
        nrs = "sudo nixos-rebuild switch --flake ${nixosDir}#lenovo";
        hms = "home-manager switch --flake ${nixosDir}#kin-lenovo";
      };
    };
  };
}
