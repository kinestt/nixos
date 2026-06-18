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
        l = "lsd -l";
        la = "lsd -a";
        lla = "lsd -la";
        lt = "lsd --tree";
      };
      enableLsColors = true;
    };
  };
}
