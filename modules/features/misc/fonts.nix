{ self, inputs, ... }: {
  flake.nixosModules.fonts = { pkgs, lib, ... }: {
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
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Ubuntu Sans" ];
          sansSerif = [ "Ubuntu Sans" ];
          monospace = [ "Iosevka Nerd Font Mono" ];
        };
      };
    };
  };
}
  
