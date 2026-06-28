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
      "linkwarden/nextauth_secret" = {};
      "linkwarden/postgres_password" = {};
    };
    services.linkwarden = {
      enable = true;
      host = "localhost";
      enableRegistration = true;
      secretFiles = {
        NEXTAUTH_SECRET = config.sops.secrets."linkwarden/nextauth_secret".path;
        POSTGRES_PASSWORD = config.sops.secrets."linkwarden/postgres_password".path;
      };
    };
  };
}
