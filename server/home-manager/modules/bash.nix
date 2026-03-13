{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin-server";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#server";
    };
  };
}

