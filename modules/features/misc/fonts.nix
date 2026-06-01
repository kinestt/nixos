{ self, inputs, ... }: {
  flake.nixosModules.fonts = { pkgs, lib, ... }: {
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
        fira-sans
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "Fira Sans" ];
          sansSerif = [ "Fira Sans" ];
          monospace = [ "JetBrains Mono Nerd Font" ];
        };
      };
    };
  };
}
  
