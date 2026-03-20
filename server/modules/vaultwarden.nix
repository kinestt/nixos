{
  services.vaultwarden = {
    enable = true;
    domain = "vault.ricepaddle.site";
    configureNginx = true;
    environmentFile = "/var/lib/vaultwarden.env";
  };
}
