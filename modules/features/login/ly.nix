{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.ly = {
    pkgs,
    lib,
    ...
  }: {
    services.displayManager.ly = {
      enable = true;
    };
  };
}
