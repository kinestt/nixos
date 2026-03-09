{ lib, config, pkgs, ... } : { 
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    zen
    appindicator
  ];
  home.file."Pictures/wallpaper.jpg".source = ./eoe_output8.png;
  dconf = {
    settings = let
      wallpaper = "file://${config.home.homeDirectory}/Picture/wallpaper.jpg";
    in 
    {
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          zen.extensionUuid
          appindicator.extensionUuid
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        text-scaling-factor = 1.25;
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/desktop/background" = {
        picture-uri = wallpaper;
        picture-uri-dark = wallpaper;
        picture-options = "zoom";
      };
    };
  };
  home.activation.setWallpaper = let
    wallpaper = "file://${config.home.homeDirectory}/Pictures/wallpaper.jpg";
  in lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.glib}/bin/gsettings set org.gnome.desktop.background picture-uri "${wallpaper}"
    ${pkgs.glib}/bin/gsettings set org.gnome.desktop.background picture-uri-dark "${wallpaper}"
  '';

  qt = {
    enable = true;
    platformTheme = {
      name = "adwaita";
      package = pkgs.adwaita-qt6;
    };
    style = { 
      name = "adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

}
