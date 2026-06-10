{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.lenovoConfiguration = {
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.lenovoHardware
      self.nixosModules.niri
      self.nixosModules.ly
      self.nixosModules.pipewire
      self.nixosModules.fonts
      self.nixosModules.foot
      self.nixosModules.yazi
      self.nixosModules.nvim
      self.nixosModules.tmux
      self.nixosModules.fish
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;
    time.timeZone = "Asia/Kolkata";

    users.users.kin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
        libnotify
        usbutils
        glib
        wine-wayland
        protontricks
        wget
        home-manager

        inputs.xwayland-satellite-unscaled.packages.${pkgs.system}.xwayland-satellite
      ];
    };

    services.gvfs.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];

    programs = { 
      dconf.enable = true;
      localsend.enable = true;
    };

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
    # hardware.nvidia.prime = {
    #   sync.enable = true;
    #   amdgpuBusId = "PCI:06:0:0";
    #   nvidiaBusId = "PCI:01:0:0";
    # };

    environment = { 
      systemPackages = with pkgs; [
        git
      ];
      variables = {
        EDITOR = "vim";
      };
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    networking.wireless.enable = false;
    networking.wireless.iwd.enable = true;
    networking.networkmanager.wifi.backend = "iwd";

    swapDevices = [
      { 
        device = "/var/lib/swapfile";
        size = 24 * 1024;
      }
    ];
    system.stateVersion = "25.11";
  };
}
