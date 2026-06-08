{
  ...
}: {
  flake.homeModules.gtk = {
    pkgs,
    ...
  }: {
    gtk = {
      enable = true;
      font = {
        name = "IBM Plex Sans";
        package = pkgs.ibm-plex; 
      };
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
      iconTheme = {
        name = "rose-pine";
        package = pkgs.rose-pine-icon-theme;
      };
      gtk4.theme = null;
      gtk3.extraConfig.gtk-application-prefer-light-theme = true;
      gtk4.extraConfig.gtk-application-prefer-light-theme = true;
    };
    dconf.settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/interface".gtk-theme = "rose-pine";
    };
  };
}
