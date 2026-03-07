{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#laptop";
    };
  };
}
