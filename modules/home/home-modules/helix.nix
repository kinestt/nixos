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
        theme =  "rose_pine_transparent";
      };
      themes."rose_pine_transparent" = {
        inherits = "rose_pine";
        "ui.background" = {};
      };
    };
  };
}
