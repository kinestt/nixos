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
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;
    time.timeZone = "Asia/Kolkata";

    users.users.kin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
        tree
        git
        libnotify
        usbutils
        glib
        android-tools
        btop
        easyeffects
        lutris
        wine-wayland
        protonup-qt
        protontricks
      ];
    };

    services.gvfs.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];

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

    programs.firefox.enable = true;

    environment = { 
      systemPackages = [
        pkgs.wget
        pkgs.neovim
        pkgs.home-manager
        inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
        inputs.helium.packages.${pkgs.system}.helium
        inputs.xwayland-satellite-unscaled.packages.${pkgs.system}.xwayland-satellite
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

    system.stateVersion = "25.11";
  };
}
