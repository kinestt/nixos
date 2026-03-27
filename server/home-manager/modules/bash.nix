{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin-server";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#server";
      pushgit = ''git -C ${config.home.homeDirectory}/nixos add . && git -C ${config.home.homeDirectory}/nixos commit -m "commit" && git -C ${config.home.homeDirectory}/nixos push'';
    };
  };
}

