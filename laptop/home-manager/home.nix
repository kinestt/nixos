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
      p7zip 
      dig
 
      # GUI
      spotify
      equibop
      bitwarden-desktop
      qbittorrent      
      jellyfin-media-player
      prismlauncher-9
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
    ./modules/bundle.nix
  ];
  nixpkgs.config.allowUnfree = true;
}
