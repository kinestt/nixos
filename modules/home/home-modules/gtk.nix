{ self, inputs, ... }: {
  flake.homeModules.gtk = { pkgs, config, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "rose-pine";
        package = pkgs.rose-pine-gtk-theme;
      };
      iconTheme = {
        name = "rose-pine";
        package = pkgs.rose-pine-icon-theme;
      };
      gtk4.theme = null;
    };
  };
}
