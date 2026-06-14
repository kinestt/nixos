{
  ...
}: {
  flake.homeModules.waybar = {
    ...
  }: {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 25;
          spacing = 2;
          modules-center = ["niri/window"];
          modules-left = ["niri/workspaces"];
          modules-right = ["tray" "custom/seperator" "cpu" "custom/seperator" "memory" "custom/seperator" "battery" "custom/seperator" "clock#date" "custom/seperator" "clock#time" "custom/seperator"];
          "cpu" = {
            interval = 10;
            format = "Cpu: {usage}%";
          };
          "memory" = {
            interval = 30;
            format = "Ram: {}%";
          };
          "battery" = {
            format = "Battery: {capacity}%";
          };
          "clock#date" = {
            format = "Date: {:%d/%m(%a)}";
          };
          "clock#time" = {
            format = "Time: {:%I:%M %p}";
            interval = 1;
          };
          "custom/seperator" = {
            format = "|";
            tooltip = false;
          };
        };
      };
      style = "
        #waybar {
        font-family: 'Futura', 'BlexMono Nerd Font Propo' ;
          font-weight: normal;
          background-color: rgba(25, 23, 36, 0.7);
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
          all: initial;
          color: #6e6a86;
          padding: 0 8px;
          margin: 0;
        }
        #workspaces button.active {
          color: #c4a7e7;
        }
        #workspaces button:hover {
          color: #908caa;
        }
        #custom-seperator {
          color: #9893a5;
          padding: 0px;
        }
      ";
    };
  };
}
