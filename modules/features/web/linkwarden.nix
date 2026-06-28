{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.linkwarden = {
    config,
    ...
  }: {
    sops.secrets = {
      "linkwarden/nextauth_secret" = {
        owner = config.services.linkwarden.user;
      };
      "linkwarden/postgres_password" = {
        owner = config.services.linkwarden.user;
      };
    };
    services.linkwarden = {
      enable = true;
      host = "0.0.0.0";
      enableRegistration = false;
      secretFiles = {
        NEXTAUTH_SECRET = config.sops.secrets."linkwarden/nextauth_secret".path;
        POSTGRES_PASSWORD = config.sops.secrets."linkwarden/postgres_password".path;
      };
    };
  };
}
