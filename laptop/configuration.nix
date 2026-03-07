{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
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

  services.displayManager.gdm.enable = true;
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
  environment.systemPackages = with pkgs; [
    vim
    wayland-utils
    wl-clipboard
    home-manager
    gnome-tweaks
    easyeffects
  ];

  programs.firefox.enable = true;
  services = {
    openssh.enable = true;
    flatpak.enable = true;
  };
  networking.firewall.enable = false;
  system.stateVersion = "25.11"; # Did you read the comment?
}

