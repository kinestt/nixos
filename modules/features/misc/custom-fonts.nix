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
        pkgs.nerd-fonts.iosevka
        pkgs.lexend
        self.packages.${pkgs.stdenv.hostPlatform.system}.illinois-mono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Lexend Deca"];
          sansSerif = ["Lexend Deca"];
          monospace = ["IllinoisMono Nerd Font Mono"];
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
        name = "Lexend Deca";
        size = 12.5;
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
      '';
    };
    packages.illinois-mono = pkgs.stdenv.mkDerivation {
      name = "Illinois Mono";
      pname = "illinois-mono";
      src = "${customFontsDir}";
      nativeBuildInputs = [ pkgs.nerd-font-patcher ];
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp IllinoisMono-Regular.ttf -t $out/share/fonts/truetype/

        mkdir -p $out/share/fonts/truetype/{illinois-mono,illinois-mono-nerd}
        mv $out/share/fonts/truetype/*.ttf $out/share/fonts/truetype/illinois-mono/
        for f in $out/share/fonts/truetype/illinois-mono/*.ttf; do
          nerd-font-patcher --complete --variable-width-glyphs --outputdir $out/share/fonts/truetype/illinois-mono-nerd/ $f
          nerd-font-patcher --complete --single-width-glyphs --outputdir $out/share/fonts/truetype/futura-nerd/ $f
        done
      '';
    };
  };
}
