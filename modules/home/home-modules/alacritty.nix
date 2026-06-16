{
  self,
  inputs,
  ...
}: {
  flake.homeModules.alacritty = {
    pkgs,
    ...
  }: {
    programs.alacritty = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myAlacritty;
    };
  };
  perSystem = {
    pkgs,
    ...
  }: {
    packages.myAlacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;
      settings = {
        font = {
          size = 12;
        };
        window = {
          opacity = 1;
        };
        colors = {
          primary = {
            background = "#191724";
            foreground = "#e0def4";
          };
          cursor = {
            text = "#e0def4";
            cursor = "#524f67";
          };
          vi_mode_cursor = {
            text = "#e0def4";
            cursor = "#524f67";
          };
          selection = {
            text = "#e0def4";
            background = "#403d52";
          };
          normal = {
            black = "#26233a";
            red = "#eb6f92";
            green = "#31748f";
            yellow = "#f6c177";
            blue = "#9ccfd8";
            magenta = "#c4a7e7";
            cyan = "#ebbcba";
            white = "#e0def4";
          };
          bright = {
            black = "#6e6a86";
            red = "#eb6f92";
            green = "#31748f";
            yellow = "#f6c177";
            blue = "#9ccfd8";
            magenta = "#c4a7e7";
            cyan = "#ebbcba";
            white = "#e0def4";
          };
          hints = {
            start = {
              foreground = "#908caa";
              background = "#1f1d2e";
            };
            end = {
              foreground = "#6e6a86";
              background = "#1f1d2e";
            };
          };
        };
      };
    };
  };
}
