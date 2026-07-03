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
          server = {
            port = "7878";
          };
        };
      };
    };
  };
}
