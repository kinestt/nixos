{ lib, pkgs, ... }: {

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    CHROMIUM_FLAGS = "--disable-vulkan --disable-features=Vulkan";
  };
  programs.chromium = { 
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = 
      [
       # "--ozone-platform=x11"
      ];
  };
}
