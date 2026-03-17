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
      { appId = "org.vinegarhq.Sober"; origin = "flathub-beta"; }
      { appId = "io.mrarm.mcpelauncher"; origin = "flathub"; }
    ];
    
  };
}
