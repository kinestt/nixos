{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin-server";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#server";
      pushmain = ''git -C ${config.home.homeDirectory}/nixos add . && git -C ${config.home.homeDirectory}/nixos commit -m "commit" && git -C ${config.home.homeDirectory}/nixos push'';
      pushsecret = ''git -C ${config.home.homeDirectory}/nix-secrets add . && git -C ${config.home.homeDirectory}/nix-secrets commit -m "commit" && git -C ${config.home.homeDirectory}/nix-secrets push'';
    };
  };
}

