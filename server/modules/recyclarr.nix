{ pkgs, ... }: {
  services.recyclarr = {
    enable = true;
  );
  environment.etc."recyclarr/config.yml".source = ./data/recyclarr.yml;
}
