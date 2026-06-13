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
      self.homeModules.helix
      self.homeModules.gtk-fonts
    ];
    home = {
      username = "kin";
      homeDirectory = "/home/kin";
      stateVersion = "25.11";
      packages = with pkgs; [
        swappy
        libreoffice
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
        htop
        p7zip
        blanket

        inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
      ];
    };
  };
}
