{ self, inputs, ... }: {
  flake.homeModules.kinConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.mako
      self.homeModules.alacritty
      self.homeModules.gtk
    ];
    home = { 
      username = "kin";
      homeDirectory = "/home/kin";
      stateVersion = "25.11";
      packages = with pkgs; [
        spotify
        swappy
        libreoffice
        equibop
        fastfetch
        thunar
      ];
    };
  };
}
