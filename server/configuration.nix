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
    ntfs3g 
  ];

  networking = {
    hostName = "server";
    useDHCP = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25575 25565 80 443 7878 8989 9696 42010 ];
      allowedUDPPorts = [ 19132 5544 25565 ];
      extraCommands = "  iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN \
      -j TCPMSS --clamp-mss-to-pmtu";
    };
    #interfaces = {
    #  enp6s0f3u2u3 = {
    #    mtu = 1300;
    #  };
    #};
  };

  swapDevices = [ {
    device = "/.swapfile";
    size = 16 * 1024; # Size in Megabytes
  } ];

  time.timeZone = "Asia/Kolkata";
  services.openssh.enable = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}

