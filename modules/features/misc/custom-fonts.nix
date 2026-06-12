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
        self.packages.${pkgs.stdenv.hostPlatform.system}.IBMPlexMono
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["Futura"];
          sansSerif = ["Futura"];
          monospace = ["BlexMono Nerd Font Propo"];
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
    packages.IBMPlexMono = pkgs.stdenv.mkDerivation {
      name = "IBM Plex Mono";
      pname = "ibm-plex-mono";
      src = "${customFontsDir}";
      nativeBuildInputs = [ pkgs.nerd-font-patcher ];
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp IBMPlexMono-Regular.ttf -t $out/share/fonts/truetype/

        mkdir -p $out/share/fonts/truetype/{ibm-plex-mono,ibm-plex-mono-nerd}
        mv $out/share/fonts/truetype/*.ttf $out/share/fonts/truetype/ibm-plex-mono/
        for f in $out/share/fonts/truetype/ibm-plex-mono/*.ttf; do
          nerd-font-patcher --complete --variable-width-glyphs --outputdir $out/share/fonts/truetype/ibm-plex-mono-nerd/ $f
        done
      '';
    };
  };
}
