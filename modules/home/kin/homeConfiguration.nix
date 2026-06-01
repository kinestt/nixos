{ self, inputs, ... }: {
  flake.homeModules.kinConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.mako
      self.homeModules.alacritty
    ];
    home = { 
      username = "kin";
      homeDirectory = "/home/kin";
      stateVersion = "25.11";
      packages = with pkgs; [
        spotify
        swappy
        xwayland-satellite
        libreoffice
      ];
    };
  };
}
