{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.customFonts = {
    pkgs,
    ...
  }: {
    fonts = {
      packages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.futura
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Futura"];
          sansSerif = ["Futura"];
        };
      };
    };
  };
  flake.homeModules.gtk-fonts = {
    pkgs,
    ...
  }: {
    gtk = {
      font = {
        name = "Futura";
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.futura; 
      };
    };
  };
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: let 
    customFontsDir = builtins.toString inputs.custom-fonts;
  in { 
    packages.futura = pkgs.stdenv.mkDerivation {
      name = "Futura";
      pname = "futura";
      src = "${customFontsDir}";
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp *.ttf -t $out/share/fonts/truetype/
      '';
    };
  };
}
