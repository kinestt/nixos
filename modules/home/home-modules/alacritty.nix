{ self, inputs, ... }: {
  flake.homeModules.alacritty = { pkgs, lib, ... }: {
    programs.alacritty = { 
      enable = true;
      theme = "tokyo_night";
      settings = {
        font = {
          normal = {
            family = "Jetbrains Mono Nerd Font";
          };
          bold = {
            family = "Jetbrains Mono Nerd Font";
          };
          italic= {
            family = "Jetbrains Mono Nerd Font";
          };
          bold_italic = {
            family = "Jetbrains Mono Nerd Font";
          };
        };
        window = {
          opacity = 0.85;
        };
        env = {
          "TERM" = "xterm-256color";
        };
      };
    };
  };
} 
