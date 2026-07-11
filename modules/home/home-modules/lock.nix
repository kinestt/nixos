{
  self,
  inputs,
  ...
}: {
  flake.homeModules.lock = {
    pkgs,
    ...
  }: {
    services.swayidle = 
    let
      lock = "${pkgs.swaylock}/bin/swaylock --daemonize";
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in {
      enable = true;
      timeouts = [
        {
          timeout = 90;
          command = lock;
        }
        {
          timeout = 100;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 110;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = {
        "before-sleep" = (display "off") + "; " + lock;
        "after-resume" = display "on";
        "lock" = (display "off") + "; " + lock;
        "unlock" = display "on";
      };
    };
  };
}
