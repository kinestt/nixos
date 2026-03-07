{
  services.flatpak = {
    remotes = [{
      name = "flathub-beta"; location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }];
    packages = [ 
      "org.vinegarhq.Sober"
    ];
  };
}
