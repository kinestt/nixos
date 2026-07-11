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
      self.homeModules.lock
      self.homeModules.mako
      self.homeModules.alacritty
      self.homeModules.gtk
      self.homeModules.fuzzel
      self.homeModules.firefox
      self.homeModules.helix
      self.homeModules.chromium
      self.homeModules.gtk-fonts
      self.homeModules.emacs
      self.homeModules.waybar
      self.homeModules.zen-browser
    ];
    home = {
      username = "kin";
      homeDirectory = "/home/kin";
      stateVersion = "25.11";
      packages = with pkgs; [
        spotify
        swappy
        libreoffice
        fastfetch
        qbittorrent-nox
        mpv
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
        tidal-hifi
        jellyfin-mpv-shim

        inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
      ];
      sessionVariables = {
        GTK_DEBUG = "portals";
        GTK_USE_PORTAL = 1;
      };
    };
  };
}
