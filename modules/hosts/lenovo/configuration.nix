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
      self.nixosModules.yazi
      self.nixosModules.vim
      self.nixosModules.nvf
      self.nixosModules.tmux
      self.nixosModules.foot
      self.nixosModules.bash
      self.nixosModules.fish
      self.nixosModules.bash
      self.nixosModules.customFonts
    ];

    #boot.loader.systemd-boot.enable = true;
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "lenovo";

    networking.networkmanager.enable = true;
    time.timeZone = "Asia/Kolkata";

    users.users.kin = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.bash;
      home = "/home/kin/";
      packages = with pkgs; [
        libnotify
        usbutils
        glib
        wine-wayland
        protontricks
        wget
        home-manager
        bat
        unzip
        zip
        spotify

        #inputs.xwayland-satellite-unscaled.packages.${pkgs.system}.xwayland-satellite
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
    #services.xserver.videoDrivers = ["nvidia"];
    #hardware.nvidia.open = true;
    #hardware.nvidia.modesetting.enable = true;
    # hardware.nvidia.prime = {
    #   sync.enable = true;
    #   amdgpuBusId = "PCI:06:0:0";
    #   nvidiaBusId = "PCI:01:0:0";
    # };

    environment = { 
      systemPackages = with pkgs; [
        git
        #(pkgs.spotify.overrideAttrs (old: {
        #  nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
        #    pkgs.makeWrapper
        #  ];
        #  postInstall = (old.postInstall or "") + ''
        #    wrapProgram $out/bin/spotify \
        #      --add-flags "--enable-features=UseOzonePlatform"\
        #      --add-flags "--ozone-platform=wayland"
        #  '';
        #}))
      ];
      variables = {
        EDITOR = "vim";
      };
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
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
        size = 64 * 1024;
      }
    ];
    system.stateVersion = "25.11";
  };
}
