{ pkgs, ... }: {
  services.jellyfin = { 
    enable = false;
    openFirewall = true;
  };
  users.users.jellyfin.extraGroups = [ "media" ];
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
