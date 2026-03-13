{ pkgs, ... }: {
  home = {
    username = "kin";
    homeDirectory = "/home/kin";
    stateVersion = "25.11";
  };
  imports = [
    ./modules/bundle.nix
  ];
}
