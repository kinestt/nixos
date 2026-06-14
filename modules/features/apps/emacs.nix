{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.emacs = {
    pkgs,
    ...
  }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myEmacs
      pkgs.emacs-pgtk
    ];
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myEmacs = inputs.wrapper-modules.wrappers.emacs.wrap {
      inherit pkgs;
      emacsPackages = epkgs: with epkgs.melpaPackages; [
        evil
	      nix-mode
	      nixfmt
      ];
      configFile = ''
        (use-package evil
          :ensure t
          :config
          (evil-mode 1))
      '';
    };
  };
}
