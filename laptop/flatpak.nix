{
  services.flatpak = {
    enable = true;
    remotes = [{
      name = "flathub-beta"; 
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    packages = [ 
     { appId = "org.vinegarhq.Sober"; origin = "flathub-beta"; }
    ];
  };
}
