{
  self,
  inputs,
  ...
}: {
  flake.homeModules.spicetify = {
    pkgs,
    ...
  }: {
    imports = [
      inputs.spicetify-nix.homeManagerModules.spicetify
    ];

    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
      ];
      theme = spicePkgs.themes.text;
      colorScheme = "Gruvbox";
    };
  };
}
