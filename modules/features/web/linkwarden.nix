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
        NEXTAUTH_SECRET._secret = config.sops.secrets."linkwarden/nextauth_secret".path;
      };
    };
  };
}
