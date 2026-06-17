{
  ...
}: {
  flake.homeModules.emacs = {
    pkgs,
    ...
  }: { 
    programs.emacs = {
      enable = true;
      package = (pkgs.emacs-git-pgtk.override { withTreeSitter = true; });

      extraPackages = epkgs: [
        epkgs.evil
        epkgs.catppuccin-theme
				epkgs.vterm
      ];
    };

    home.file = {
      emacs = {
        source = ./init.el;
        target = ".emacs.d/init.el";
      };
      emacs-init = {
        source = ./early-init.el;
        target = ".emacs.d/early-init.el";
      };
    };
  };
}
