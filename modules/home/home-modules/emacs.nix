{
  self,
  inputs,
  ...
}: { 
  flake.homeModules.emacs = {
    pkgs,
    ...
  }: {
    programs.emacs = {
      enable = true;
      package = pkgs.emacs;
      extraPackages = epkgs: [
        epkgs.elpaca
      ]; 
      extraConfig = builtins.readFile /home/kin/.config/emacs/init.el;
    };
  };
}
