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
    };
    services.linkwarden = {
      enable = true;
      host = "127.0.0.1";
      enableRegistration = true;
      secretFiles = {
        NEXTAUTH_SECRET = config.sops.secrets."linkwarden/nextauth_secret".path;
      };
    };
  };
}
