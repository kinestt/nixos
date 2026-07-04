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
            format-paused = "{status_icon} <i>{title}</i>";
            player-icons =  {
              default = "▶";
              spotify = "";
              firefox = "󰈹";
              chromium = "";
            };
            status-icons = {
              paused =  "⏸";
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
          background-color: rgba(40, 40, 40, 1);
      }

      #cpu {
          color: #d3869b;
      }

      #memory {
          color: #8ec07c;
      }

      #battery {
          color: #fabd2f;
      }

      #clock.date {
          color: #fe8019;
      }

      #clock.time {
          color: #fb4934;
      }

      #window {
          color: #928374;
      }

      #workspaces button {
          all: initial;
          color: #928374;
          padding: 0 8px;
          margin: 0;
      }

      #workspaces button.active {
          color: #b8bb26;
      }

      #workspaces button:hover {
          color: #ebdbb2;
      }

      #custom-seperator {
          color: #7c6f64;
          padding: 0px;
      }
      ";
    };
  };
}
