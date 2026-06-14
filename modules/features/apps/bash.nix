{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.bash = {
    pkgs,
    ...
  }: let 
    nixosDir = "/home/kin/nixos";
  in {
    programs.bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ${nixosDir}#$HOSTNAME";
        hms = "home-manager switch --flake ${nixosDir}#$USER-$HOSTNAME";
        y = "yazi";
      };
      enableLsColors = true;
    };
  };
}
