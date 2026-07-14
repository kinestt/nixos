{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {
    pkgs,
    lib,
    ...
  }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };
  perSystem = {
    config,
    pkgs,
    lib,
    ...
  }: let 
    wallspath = builtins.toString inputs.walls;
  in {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        hotkey-overlay = {
          skip-at-startup = _: {};
        };
        prefer-no-csd = _: {};
        input = {
          keyboard = {
            xkb.layout = "us";
          };
          touchpad = {
            #off = _: {};
            tap = _: {};
            natural-scroll = _: {};
            accel-speed = 0.2;
          };
          mouse = {
            accel-speed = 0;
          };
        };
        layout = {
          gaps = 6;
          center-focused-column = "never";
          focus-ring = {
            active-color = "#a89984";
            inactive-color = "#a89984";
            width = 2;
          };
        };
        outputs = {
          "eDP-1" = {
            # off = _: {};
            mode = "1920x1080@165.002";
            scale = 1;
            position = _: {
              props = {
                x = 0;
                y = 1080;
              };
            };
          };
          "eDP-2" = {
            off = _: {};
            mode = "1920x1080@165.000";
            scale = 1;
            position = _: {
              props = {
                x = 0;
                y = 1080;
              };
            };
          };
          "HDMI-A-1" = {
            off = _: {};
            mode = "3840x2160@143.988";
            scale = 2;
            position = _: {
              props = {
                x = 0;
                y = 0;
              };
            };
          };
        };
        window-rules = [
          {
            matches = [
              {app-id = "firefox";}
              {app-id = "helium";}
              {app-id = "spotify";}
              {app-id = "Spotify";}
              {app-id = "equibop";}
              {app-id = "zen-beta";}
              {app-id = "tidal-hifi";}
              {app-id = "chromium-browser";}
              {app-id = "io.github.tdesktop_x64.TDesktop";}
            ];
            open-maximized = true;
          }
          {
            matches = [
              { 
                app-id = "firefox$";
                title = "^Picture-in-Picture$";
              }
              {
                title = "Picture in picture";
              }
            ];
            open-floating = true;
            default-column-width = [ { fixed = 480; } ];
            default-window-height = [ { fixed = 270; } ];
          }
        ];
        layer-rules = [
          {
            matches = [
              {namespace = "^launcher$";}
            ];
            background-effect = {
              blur = false;
            };
          }
        ];
        binds = {
          "Alt+Return".spawn-sh = "foot";
          "Alt+D".spawn-sh = "fuzzel";
          "Alt+B".spawn-sh = "zen-beta";
          "Alt+P".spawn-sh = "spotify";
          "Alt+U".spawn-sh = "emacsclient -c";

          "Alt+F".maximize-column = _: {};
          "Alt+Shift+F".fullscreen-window = _: {};

          "Alt+Space".toggle-overview = _: {};
          "Alt+Q".close-window = _: {};

          "Alt+BracketLeft".consume-or-expel-window-left = _: {};
          "Alt+BracketRight".consume-or-expel-window-right = _: {};

          "Alt+H".focus-column-left = _: {};
          "Alt+J".focus-window-down = _: {};
          "Alt+K".focus-window-up = _: {};
          "Alt+L".focus-column-right = _: {};

          "Alt+Ctrl+H".move-column-left = _: {};
          "Alt+Ctrl+J".move-window-down = _: {};
          "Alt+Ctrl+K".move-window-up = _: {};
          "Alt+Ctrl+L".move-column-right = _: {};

          "Alt+1".focus-workspace = 1;
          "Alt+2".focus-workspace = 2;
          "Alt+3".focus-workspace = 3;
          "Alt+4".focus-workspace = 4;
          "Alt+5".focus-workspace = 5;
          "Alt+6".focus-workspace = 6;
          "Alt+7".focus-workspace = 7;
          "Alt+8".focus-workspace = 8;
          "Alt+9".focus-workspace = 9;

          "Alt+Ctrl+1".move-column-to-workspace = 1;
          "Alt+Ctrl+2".move-column-to-workspace = 2;
          "Alt+Ctrl+3".move-column-to-workspace = 3;
          "Alt+Ctrl+4".move-column-to-workspace = 4;
          "Alt+Ctrl+5".move-column-to-workspace = 5;
          "Alt+Ctrl+6".move-column-to-workspace = 6;
          "Alt+Ctrl+7".move-column-to-workspace = 7;
          "Alt+Ctrl+8".move-column-to-workspace = 8;
          "Alt+Ctrl+9".move-column-to-workspace = 9;

          "Alt+Shift+H".focus-monitor-left = _: {};
          "Alt+Shift+J".focus-monitor-down = _: {};
          "Alt+Shift+K".focus-monitor-up = _: {};
          "Alt+Shift+L".focus-monitor-right = _: {};

          "Alt+Shift+Ctrl+H".move-column-to-monitor-left = _: {};
          "Alt+Shift+Ctrl+J".move-column-to-monitor-down = _: {};
          "Alt+Shift+Ctrl+K".move-column-to-monitor-up = _: {};
          "Alt+Shift+Ctrl+L".move-column-to-monitor-right = _: {};

          "Alt+WheelScrollDown".focus-workspace-down = _: {};
          "Alt+WheelScrollUp".focus-workspace-up = _: {};
          "Alt+Ctrl+WheelScrollDown".move-column-to-workspace-down = _: {};
          "Alt+Ctrl+WheelScrollUp".move-column-to-workspace-up = _: {};
          "Alt+Shift+WheelScrollDown".focus-column-left = _: {};
          "Alt+Shift+WheelScrollUp".focus-column-right = _: {};

          "Alt+C".center-column = _: {};
          "Alt+V".toggle-window-floating = _: {};
          "Alt+Shift+V".switch-focus-between-floating-and-tiling = _: {};
          "Alt+W".toggle-column-tabbed-display = _: {};
          "Print".screenshot = _: {};
          "Ctrl+Print".screenshot-screen = _: {};
          "Alt+Print".screenshot-window = _: {};

          "Alt+Shift+E".quit = _: {};

          "Alt+Minus".set-column-width = "-10%";
          "Alt+Equal".set-column-width = "+10%";
          "Alt+Shift+Minus".set-window-height = "-10%";
          "Alt+Shift+Equal".set-window-height = "+10%";

          "XF86AudioRaiseVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
          "XF86AudioLowerVolume".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
          "XF86AudioMute".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "Alt+M".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          "XF86MonBrightnessUp".spawn-sh = "${lib.getExe pkgs.brightnessctl} -c backlight s 10%+";
          "XF86MonBrightnessDown".spawn-sh = "${lib.getExe pkgs.brightnessctl} -c backlight s 10%-";


          "Alt+F2".spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          "Alt+F3".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
          "Alt+F4".spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
          "Alt+F6".spawn-sh = "${lib.getExe pkgs.brightnessctl} -c backlight s 10%+";
          "Alt+F5".spawn-sh = "${lib.getExe pkgs.brightnessctl} -c backlight s 10%-";

          "Alt+T".spawn-sh = ''notify-send "Current Time" "$(date +"%I:%M %p")"'';
          "Alt+Shift+P".spawn-sh = "niri msg action power-off-monitors";
        };
        spawn-sh-at-startup = [
          "${lib.getExe pkgs.swaybg} -i ${wallspath}/railway.jpg"
          "waybar"
        ];
      };
    };
  };
}
