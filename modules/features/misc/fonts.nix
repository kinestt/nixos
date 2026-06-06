{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.fonts = {
    pkgs,
    lib,
    ...
  }: {
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
        nerd-fonts.ubuntu-mono
        nerd-fonts.iosevka
        nerd-fonts.hack
        overpass
        fira-sans
        ubuntu-sans
        inter
        maple-mono.NF
        ibm-plex
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = ["IBM Plex Sans"];
          sansSerif = ["IBM Plex Sans"];
          monospace = ["JetBrains Mono Nerd Font Mono"];
        };
      };
    };
  };
}
