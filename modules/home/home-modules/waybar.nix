{ self, inputs, ... }: {
  flake.homeModules.waybar = { pkgs, inputs, ... }: {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 10;
          spacing = 15;
          modules-center = [ "niri/window" ];
          modules-left = [ "niri/workspaces" ];
          modules-right = [ "tray" "cpu" "memory" "battery" "clock#date" "clock#time" ];
          "cpu" = {
            interval = 10;
            format = " {usage}%";
          };
          "memory" = {
            interval = 30;
            format = " {}%";
          };
          "battery" = {
            format = "󰂅 {capacity}%";
          };
          "clock#date" = {
            format = " {:%d/%m(%a)}";
          };
          "clock#time" = {
            format = "󰥔 {:%H:%M}";
            interval = 1;
          };
        };
      };
      style = "
        #waybar {
          font-family: 'JetBrains Mono Nerd Font', sans-serif;
          font-size: 14px;
          background-color: #191724;
        }
        #cpu {
          color: #c4a7e7;
        }
        #memory {
          color: #9ccfd8;
        }
        #battery {
          color: #ebbcba;
        }
        #clock.date {
          color: #f6c177;
        }
        #clock.time {
          color: #eb6f92;
        }
        #window {
          color: #6e6a86;
        }
        #workspaces button {
          color: #6e6a86;
        }
      ";
    };
  };
}
