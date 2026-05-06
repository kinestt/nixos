{ config, ... }: {

  services.silverbullet = {
    enable = true;
    user = "kin";
    group = "users";
    envFile = "${config.users.users.kin.home}/data/silverbullet/.env";
    spaceDir = "${config.users.users.kin.home}/data/silverbullet/space";
    listenPort = 10040;
    listenAddress = "0.0.0.0";
  };

}
