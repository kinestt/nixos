{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bundle.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  users.users.kin ={
    isNormalUser = true;
    description = "kin";
    extraGroups = ["wheel"];
    shell = pkgs.bash;
    home =  "/home/kin";
  };
  boot.loader.grub.device = "/dev/nvme0n1p1";
  environment.systemPackages = with pkgs; [ 
    vim
    git
    bat
    htop
    home-manager 
  ];

  networking = {
    hostName = "server";
    networkmanager.enable = true;
    firewall = {
      allowedUDPPorts = [ 19132 ];
    };
  };

  time.timeZone = "Asia/Kolkata";
  services.openssh.enable = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}

