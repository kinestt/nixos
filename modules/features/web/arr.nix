{
  self,
  input,
  ...
}: {
  flake.nixosModules.arr = {
    services = {
      radarr = {
        enable = true;
        settings = {
          port = 7878;
        };
      };
    };
  };
}
