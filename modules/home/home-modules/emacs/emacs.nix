{
  ...
}: {
  flake.homeModules.emacs = {
    pkgs,
    ...
  }: { 
    programs.emacs = {
      enable = true;
      package = (pkgs.emacs-pgtk.override { withTreeSitter = true; });

      extraPackages = epkgs: with epkgs; [
        evil
        nerd-icons
				vterm
				autothemer
				nix-mode
        rainbow-mode
        pdf-tools
        emms
        base16-theme
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
