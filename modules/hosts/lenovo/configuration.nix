{ self, inputs, ... }: { 

  flake.nixosModules.lenovoConfiguration = { config, lib, pkgs, ... }: {
    imports =
      [ 
        self.nixosModules.lenovoHardware
        self.nixosModules.niri
        self.nixosModules.ly
        self.nixosModules.vim
        self.nixosModules.pipewire
      ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;
    time.timeZone = "Asia/Kolkata";

    users.users.kin = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; 
      packages = with pkgs; [
        tree
        # spotify
        helium
        git
        libnotify
        git
        equibop
        usbutils
        glib
        android-tools
      ];
    };

    services.gvfs.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:06:0:0";
      nvidiaBusId = "PCI:01:0:0";
    };


    programs.firefox.enable = true;

    environment.systemPackages = [
      pkgs.wget
      pkgs.neovim
      pkgs.home-manager
      inputs.prismlauncher.packages.${pkgs.system}.prismlauncher 
    ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.iosevka
    ];  
    fonts.fontconfig = { 
      enable = true;
      defaultFonts = {
        serif = [ "Iosevka Nerd Font" ];
        sansSerif = [ "Iosevka Nerd Font" ];
        monospace = [ "Iosevka Nerd Font" ]; 
      };
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    system.stateVersion = "25.11"; 

  };


}
