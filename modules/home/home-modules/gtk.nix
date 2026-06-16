{
  self,
  ...
}: {
  flake.homeModules.gtk = {
    pkgs,
    ...
  }: {
    gtk = {
      enable = true;
    };
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
    };
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };
}
