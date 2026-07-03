{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.jellyfin = {
    services.jellyfin = {
      enable = false;
    };
  };
}
