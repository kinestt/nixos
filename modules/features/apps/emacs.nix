{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.emacs = {
    pkgs,
    ...
  }: {
    services.emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
    };
  };
}

