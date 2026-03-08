{ pkgs, ... }: {
  programs.lutris = {
    enable = true;
    defaultWinePackage = pkgs.proton-ge-bin;
    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamescope
      umu-launcher
    ];
    protonPackages = [
      pkgs.proton-ge-bin
    ];
  };
}
