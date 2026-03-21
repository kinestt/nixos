{ config, pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      hms = "home-manager switch --flake /home/kin/nixos/#kin-laptop";
      rebuild = "sudo nixos-rebuild switch --flake /home/kin/nixos#laptop";
      pushgit = ''git -C ${config.home.homeDirectory}/nixos add . && git -C ${config.home.homeDirectory}/nixos commit -m "commit" && git -C ${config.home.homeDirectory}/nixos push'';
    };
    bashrcExtra = ''
      export SSH_AUTH_SOCK=/home/kin/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
      [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
    '';
  };
}
