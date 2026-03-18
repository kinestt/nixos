{ pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin-laptop";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#laptop";
    };
    bashrcExtra = "
      export SSH_AUTH_SOCK=/home/kin/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
    ";
  };
}
