{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    ...
  }: {
    packages.whatmp3 = pkgs.stdenvNoCC.mkDerivation rec {
      pname = "whatmp3";
      version = "3.9";
      src = pkgs.fetchFromGitHub {
        owner = "RecursiveForest";
        repo = "whatmp3";
        rev = "v${version}";
        hash = "sha256-5ob0My/lUVhNOlluKUlmb1OXaOgdZrJ+SH9RD3lXEgo=";
      };

      nativeBuildInputs = [
        pkgs.makeWrapper
      ];

      installPhase = ''
        runHook preInstall

        mkdir -p "$out/bin"
        mkdir -p "$out/share/man/man1"

        install -Dm755 whatmp3.py "$out/bin/whatmp3"
        install -Dm644 whatmp3.1 "$out/share/man/man1/whatmp3.1"

        patchShebangs "$out/bin"

        wrapProgram "$out/bin/whatmp3" \
          --prefix PATH : ${
              pkgs.lib.makeBinPath [
                  pkgs.flac
                  pkgs.lame
                  pkgs.vorbis-tools
                  pkgs.ffmpeg
                  pkgs.sox
                  pkgs.mktorrent
                  pkgs.mp3gain
                  pkgs.vorbisgain
                  pkgs.python3
                  pkgs.aacgain
              ]
          }

         runHook postInstall
      '';
      };
    };
    
  flake.nixosModules.whatmp3 = {
    pkgs,
    ...
  }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.whatmp3
    ];
  };
}
