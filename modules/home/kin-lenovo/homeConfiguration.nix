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
      self.homeModules.chromium
      self.homeModules.gtk-fonts
      self.homeModules.emacs
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
        nautilus
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
        nwg-look
        lsd
        via
        streamrip

        inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
      ];
    };
  };
}
