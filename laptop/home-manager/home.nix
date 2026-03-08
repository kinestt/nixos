{ pkgs, ... }: {
  home = {
    username = "kin";
    homeDirectory = "/home/kin";
    stateVersion = "25.11";
    packages = with pkgs; [
      htop
      zip
      unzip
      bat 
      android-tools
      noto-fonts-cjk-sans
      fastfetch 

      # GUI
      spotify
      discord
      equibop
      bitwarden-desktop

      # GNOME
    ]; 
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
  programs.git = {
    enable = true;
    settings.user.email = "kinestt@proton.me";
  };
  imports = [
    ./bundle.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
