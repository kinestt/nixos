{ pkgs, ... }: {
  programs.lutris = {
    enable = true;
  };
  home.packages = with pkgs; [ 
    winetricks
    wineWow64Packages.stable
  ];
}
