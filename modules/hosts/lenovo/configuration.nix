{ self, inputs, ... }: { 

  flake.nixosModules.lenovoConfiguration = { config, lib, pkgs, ... }: {
    imports =
      [ 
        self.nixosModules.lenovoHardware
        self.nixosModules.niri
        self.nixosModules.ly
        self.nixosModules.vim
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
        discord
        helium
        git
        libnotify
        git
      ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;
    hardware.nvidia.modesetting.enable = true;

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      wget
      neovim
      home-manager
    ];

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];  

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    system.stateVersion = "25.11"; 

  };


}
