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
      git
      android-tools
      noto-fonts-cjk-sans 

      # GUI
      spotify
      discord
    ]; 
  };
}
