{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.vaultwarden = {
    services.vaultwarden = {
      enable = true;
      domain = "vault.server.lan";
      configureNginx = true;
      environmentFile = "/var/lib/vaultwarden.env";
    };
  };
}
