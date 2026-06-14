{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.stirlingpdf = {
    services.stirling-pdf = {
      enable = true;
      environment = {
        SERVER_PORT = 8877;
        SECURITY_ENABLELOGIN = false;
      };
    };
  };
}
        
