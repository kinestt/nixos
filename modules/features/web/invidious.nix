{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.invidious = {
    services.invidious = {
      enable = true;
      port = 3001;
    };
  };
}
