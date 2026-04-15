{ config, lib, pkgs, inputs, ... }:
let 
  secretspath = builtins.toString inputs.nix-secrets;
in {
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

  sops = {
    defaultSopsFile = "${secretspath}/secrets/server.yaml";
    age = {
      sshKeyPaths = ["${config.users.users.kin.home}/.ssh/id_ed25519"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      lidarr_api_key = {};
      lidarr_api_env = {};
      radarr_api_key = {};
      radarr_api_env = {};
      sonarr_api_key = {};
      sonarr_api_env = {};
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
    sops
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

