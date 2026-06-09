{ 
  ...
}: {
  flake.homeModules.helix = {
    programs.helix = {
      enable = true;
      settings = {
        theme = "rose_pine";
      };
    };
  };
}
