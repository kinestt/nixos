{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.vaultwarden = {
    services.vaultwarden = {
      enable = true;
      domain = "vault.server.org";
      configureNginx = true;
      environmentFile = "/var/lib/vaultwarden.env";
    };
  };
}
