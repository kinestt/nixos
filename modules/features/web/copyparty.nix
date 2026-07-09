{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.copyparty = {
    config,
    ...
  }: {
    imports = [
      inputs.copyparty.nixosModules.default
    ];
    sops.secrets = {
      "copyparty/kin/password" = {
        owner = config.services.copyparty.user;
      };
    };
    services.copyparty = {
      enable = true;
      user = "kin";
      group = "users";
      accounts = {
        kin.passwordFile = config.sops.secrets."copyparty/kin/password".path;
      };
    };
  };
}
