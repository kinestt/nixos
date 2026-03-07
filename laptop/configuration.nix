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
  # KDE
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
    }; 
  };
  environment.systemPackages = with pkgs; [
    vim
    kdePackages.kclock
    kdePackages.ksystemlog 
    kdePackages.sddm-kcm
    wayland-utils
    wl-clipboard
  ];
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa 
    kdePackages.kdepim-runtime 
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation
    kdePackages.kpat
    kdePackages.ksudoku
    kdePackages.ktorrent
  ];
  nixpkgs.config.allowUnfree = true;   
  programs.firefox.enable = true;
  services.openssh.enable = true;
  networking.firewall.enable = false;
  system.stateVersion = "25.11"; # Did you read the comment?
}

