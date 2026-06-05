{ self, inputs, ... }: {
  flake.nixosModules.qbittorrent = { pkgs, lib, ... }: {
    services.qbittorrent = {
      enable = true;
      webuiPort = 8888;
      extraArgs =
        [
          "--confirm-legal-notice"
        ];
      torrentingPort = 5555;
    };
    users.users.qbittorrent.extraGroups = [ "users" ];
    systemd.services.qbittorrent = {
      serviceConfig = {
        UMask = "000";
      };
    };
  };
}
