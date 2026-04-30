{ config, ...}: {
  services.miniflux = {
    enable = true;
    config = {
      CREATE_ADMIN = true;
      PORT = 9090;
    };
    adminCredentialsFile = /home/kin/data/miniflux/admin-credentials;
  };
}

