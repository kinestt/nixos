{
  services.jellyfin = { 
    enable = true;
    openFirewall = true;
    user = "kin";
    group = "users";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
