{ 
  ...
}: {
  flake.homeModules.helix = {
    pkgs,
    ...
  }: {
    programs.helix = {
      enable = true;
      package = pkgs.evil-helix;
      settings = {
        theme =  "gruvbox_transparent";
      };
      themes."gruvbox_transparent" = {
        inherits = "gruvbox";
        "ui.background" = {};
      };
    };
  };
}
