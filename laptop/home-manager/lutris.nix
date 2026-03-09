{ pkgs, ... }: {
  programs.lutris = {
    enable = true;
    defaultWinePackage = pkgs.proton-ge-bin;
  };
  home.packages = with pkgs; [ 
    winetricks
    wineWow64Packages.stable
  ];
}
