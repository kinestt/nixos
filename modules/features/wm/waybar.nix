{ self, inputs, ... }: {
  flake.nixosModules.waybar = { pkgs, inputs, ... }: {
    programs.waybar = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myWaybar;
    };
  };
  perSystem = { pkgs, lib, ... }: {
    packages.myWaybar = inputs.wrapper-modules.wrappers.waybar.wrap {
      inherit pkgs;
      settings = {
        height = 30;
        layer = "top";
        spacing = 10;
        modules-center = [];
        modules-left = [ "niri/workspaces" ];
        modules-right = [ "tray" "cpu" "memory" "battery" "clock" ];
        position = "top";
      };
    };
  };
}
