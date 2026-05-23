{ self, inputs, ... }: {
  flake.homeModules.kinConfiguration = { pkgs, ... }: {
    imports = [
      self.homeModules.mako
    ];
    home = { 
      username = "kin";
      homeDirectory = "/home/kin";
      stateVersion = "25.11";
      packages = with pkgs; [
        spotify
      ];
    };
  };
}
