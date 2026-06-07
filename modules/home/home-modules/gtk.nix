{
  ...
}: {
  flake.homeModules.gtk = {
    pkgs,
    ...
  }: {
    gtk = {
      enable = true;
      colorScheme = "dark";
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
      gtk4 = {
        colorScheme = "dark";
        theme = {
          name = "rose-pine";
          package = pkgs.rose-pine-gtk-theme;
        };
      };
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    dconf.settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
    };
  };
}
