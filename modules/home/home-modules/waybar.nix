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
          height = 30;
          spacing = 10;
          modules-left = ["niri/workspaces" "mpris" ];
          modules-center = [];
          modules-right = ["tray" "cpu" "memory" "battery" "clock#date" "clock#time"];
          "cpu" = {
            interval = 10;
            format = "Cpu:{usage}%";
          };
          "memory" = {
            interval = 30;
            format = "Ram:{}%";
          };
          "battery" = {
            format = "Battery:{capacity}%";
          };
          "clock#date" = {
            format = "Date:{:%d/%m(%a)}";
          };
          "clock#time" = {
            format = "Time:{:%I:%M %p} ";
            interval = 1;
          };
          "custom/seperator" = {
            format = " | ";
            tooltip = false;
          };
          "mpris" = {
            format = "{player_icon} {title}";
            format-paused = "{status_icon} {title}";
            player-icons =  {
              default = "";
              spotify = "";
              firefox = "󰈹";
              chromium = "";
            };
            status-icons = {
              paused =  "";
            };
            interval = 1;
          };
        };
      };
      style = "
        #waybar {
            font-family: 'SF Pro', 'Iosevka Nerd Font Propo';
            font-size: 16px;
            font-weight: normal;
            background-color: rgba(31, 31, 40, 1);
        }
        
        #cpu {
            color: #938aa9;
        }
        
        #memory {
            color: #98bb6c;
        }
        
        #battery {
            color: #e6c384;
        }
        
        #clock.date {
            color: #ffa066;
        }
        
        #clock.time {
            color: #e82424;
        }
        
        #window {
            color: #727169;
        }
        
        #workspaces button {
            all: initial;
            color: #727169;
            padding: 0 8px;
            margin: 0;
        }
        
        #workspaces button.active {
            color: #7e9cd8;
        }
        
        #workspaces button:hover {
            color: #dcd7ba;
        }
        
        #custom-seperator {
            color: #54546d;
            padding: 0px;
        }
      ";
    };
  };
}
