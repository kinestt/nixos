{
  services.vaultwarden = {
    enable = true;
    domain = "https://vault.ricepaddle.site";
    configureNginx = true;
    environmentFile = "/var/lib/vaultwarden.env";
  };
}
