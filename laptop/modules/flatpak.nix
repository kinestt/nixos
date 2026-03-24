{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub-beta"; 
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [ 
      { appId = "org.vinegarhq.Sober"; origin = "flathub"; }
      { appId = "com.bitwarden.desktop"; origin = "flathub"; } 
      { appId = "com.spotify.Client"; origin = "flathub"; }
    ];
    
  };
}
