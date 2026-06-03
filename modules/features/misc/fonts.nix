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
        fira-sans
        ubuntu-sans
        inter
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Inter" ];
          sansSerif = [ "Inter" ];
          monospace = [ "JetBrains Mono Nerd Font" ];
        };
      };
    };
  };
}
  
