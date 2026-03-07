{
  services.flatpak = {
    enable = true;
    #remotes = [{
    #  name = "flathub"; location = "https://flathub.org/repo/flathub.flatpakrepo";
    #}];
    update.onActivation = false;
    update.auto = {
      enable = false;
      onCalendar = "daily";
    };
    packages = [ 
      { appId = "org.vinegarhq.Sober"; origin = "flathub-beta"; }
    ];
  };
}
