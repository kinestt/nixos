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
    hashedPasswordFile = config.sops.secrets.server_passwd.path;
  };

  sops = {
    defaultSopsFile = "${config.home.homeDirectory}/nixos/secrets/server.yaml";
    age = {
      sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      server_passwd = {
        neededForUsers = true;
      };
    };
  };

  boot.loader.grub.device = "/dev/nvme0n1p1";
  environment.systemPackages = with pkgs; [ 
    vim
    git
    bat
    htop
    home-manager
    ntfs3g
    brightnessctl
    gh
    fastfetch
    age
  ];
  networking = {
    hostName = "server";
    useDHCP = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [ 25575 25565 80 443 7878 8989 9696 42010 ];
      allowedUDPPorts = [ 19132 5544 25565 ];
      extraCommands = "  iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN \
      -j TCPMSS --clamp-mss-to-pmtu";
    };
    interfaces = {
      eno1 = {
        mtu = 1250;
      };
    };
  };

  swapDevices = [ {
    device = "/.swapfile";
    size = 16 * 1024; # Size in Megabytes
  } ];

  time.timeZone = "Asia/Kolkata";
  services.openssh.enable = true;
  system.stateVersion = "25.11"; # Did you read the comment?

}

