{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.deluge = {
    config,
    ...
  }: {
    sops.secrets = {
      "deluge/authFile" = {};
    };
    services.deluge = {
      enable = true;
      web = {
        enable = true;
        port = 8112;
      };
      declarative = true;
      authFile = config.sops.secrets."deluge/authFile".path;
      config = {
        download_location = "/mnt/external-hdd/downloads";
        allow_remote = true;
        daemon_port = 58846;
        listen_ports = [ 6881 6881 ];
        random_port = false;
      };
    };
  };
}
