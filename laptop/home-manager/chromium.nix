{ lib, pkgs, ... }: {

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    CHROMIUM_FLAGS = "--disable-vulkan --disable-features=Vulkan";
  };
  programs.chromium = { 
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = 
      [ 
       # "--ozone-platform=x11"
      ];

    extensions =
      let
        createChromiumExtensionFor = browserVersion: { id, sha256, version }:
          {
            inherit id;
            crxPath = builtins.fetchurl {
              url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
              name = "${id}.crx";
              inherit sha256;
            };
            inherit version;
          };
        createChromiumExtension = createChromiumExtensionFor (lib.versions.major pkgs.ungoogled-chromium.version);
      in 
      [
        (createChromiumExtension {
          # ublock origin
          id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
          sha256 = "sha256-SEHCSlmTsbAvzm+Qp1MWJIH/B5d+VFS9WSXUqI9fS08=";
          version = "1.69.0";
        })
        (createChromiumExtension {
          # bitwarden 
          id = "nngceckbapebfimnlniiiahkandclblb";
          sha256 = "sha256-MlSOVJ9m8FApBZ4NhCne9ja/YXuLyX25eRPj34B9jpE=";
          version = "2026.2.0";
        })
        (createChromiumExtension {
          # equicord-web 
          id = "mcambpfmpjnncfoodejdmehedbkjepmi";
          sha256 = "sha256-e/AfoyNs0q/KvtANs4TGka1Ea2o6Xj/L2Bjrc3VyF5o=";
          version = "1.14.4.1";
        })
        (createChromiumExtension {
          # violentmonkey
          id = "jinjaccalgkegednnccohejagnlnfdag";
          sha256 = "sha256-1CYC+DQm0Glg33AnkuICDyJKvLoCJUKyPPkb7VwCeqs=";
          version = "2.35.0";
        })
        (createChromiumExtension {
          # Youtube-Enhancer by VampireChicken
          id = "dejhhgdpambaambdifcfbmpliolehfaj";
          sha256 = "sha256-hyPIRBEjk45z6m8cEQyYxful4/o/VjORzlvkgzZEvdM=";
          version = "1.32.0";
        })
        (createChromiumExtension {
          # Sponsorblock
          id = "mnjggcdmjocbbbhaepdhchncahnbgone";
          sha256 = "sha256-Nnud/gWl8DVIUa4g4oDYklDZclQRklHl5Uxvh/aEPYQ=";
          version = "6.1.2";
        })
      ];
  };
}
