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
        pkgs.nerd-fonts.blex-mono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Futura"];
          sansSerif = ["Futura"];
          monospace = ["BlexMono Nerd Font Mono"];
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
        package = pkgs.nerd-fonts.blex-mono; 
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
      nativeBuildInputs = [ pkgs.nerd-font-patcher ];
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp futura.ttf -t $out/share/fonts/truetype/

        mkdir -p $out/share/fonts/truetype/{futura,futura-nerd}
        mv $out/share/fonts/truetype/*.ttf $out/share/fonts/truetype/futura/
        for f in $out/share/fonts/truetype/futura/*.ttf; do
          nerd-font-patcher --complete --variable-width-glyphs --outputdir $out/share/fonts/truetype/futura-nerd/ $f
        done
      '';
    };
  };
}
