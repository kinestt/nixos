{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./flatpak.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # USERS   
  users.users.kin = {
    isNormalUser = true;
    description = "kin";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    home = "/home/kin";
  };
  # GRUB
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.displayManager.gdm = {
    enable = true;
  };
  services.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    cheese
    gnome-music
    gedit 
    epiphany 
    geary
    gnome-characters
    tali
    iagno
    hitori
    atomix
    yelp
    gnome-contacts
    gnome-initial-setup
  ];
  programs.dconf.enable = true;

  nixpkgs.overlays = [
    (final: prev:
      let
        pkgs94 = import (builtins.fetchTarball{
          url = "https://github.com/NixOS/nixpkgs/archive/e6f23dc08d3624daab7094b701aa3954923c6bbb.tar.gz";
          sha256 = "sha256:0m0xmk8sjb5gv2pq7s8w7qxf7qggqsd3rxzv3xrqkhfimy2x7bnx";
        }) {
          system = prev.system;
        };
      in {
        prismlauncher-9 = pkgs94.prismlauncher;
      })
  ];
  environment.systemPackages = with pkgs; [ 
    vim
    wayland-utils
    wl-clipboard
    home-manager
    gnome-tweaks
    easyeffects
    prismlauncher-9
  ];
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      libvdpau-va-gl
      intel-media-driver
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
  services.xserver.videoDrivers = [ "modesetting" ];


  swapDevices = [ {
    device = "/.swapfile";
    size = 16 * 1024; # Size in Megabytes
  } ];

  nixpkgs.config.allowUnfree = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.firefox.enable = true;
  services = {
    openssh.enable = true;
    flatpak.enable = true;
  };
  networking.firewall.enable = false;
  system.stateVersion = "25.11"; # Did you read the comment?
}

