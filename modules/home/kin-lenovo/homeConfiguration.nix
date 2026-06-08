{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kinConfiguration = {
    pkgs, 
    ...
  }: {
    imports = [
      self.homeModules.mako
      self.homeModules.alacritty
      self.homeModules.gtk
      self.homeModules.fuzzel
      self.homeModules.waybar
      self.homeModules.firefox
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
        qbittorrent-nox
        mpv
        pcmanfm
        _64gram
        helium
        btop
        lutris
        android-tools
        protonup-qt
        tree

        inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
      ];
    };
  };
}
