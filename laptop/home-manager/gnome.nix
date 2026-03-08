{ pkgs, ... } : { 
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    zen
    appindicator
  ];

  dconf = {
    settings = {
      "org/gnome/mutter" = {
         experimental-features = [ "scale-monitor-framebuffer" ];
      };
      "org/gnome/shell" = {
         disable-user-extensions = false;
         enabled-extensions = with pkgs.gnomeExtensions; [
           blur-my-shell.extensionUuid
           zen.extensionUuid
           appindicator.extensionUuid
         ];
       };
    };
  };
}
