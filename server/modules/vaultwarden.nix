{
  services.vaultwarden = {
    enable = true;
    domain = "vault.peanutbutter.quest";
    configureNginx = true;
    environmentFile = "/var/lib/vaultwarden.env";
  };
}
