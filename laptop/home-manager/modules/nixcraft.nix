{ config, pkgs, lib, inputs, ... }: {
  nixcraft = {
    enable = true; 
    server.instances = {};
    client = {
      shared = {
        files."screenshots".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Pictures";
        account = {
          username = "kin";
          uuid = "bcd855b0-9c66-4583-bbd3-68799d3259c8";
          offline = true;
        };
        binEntry.enable = true;
      };
      instances = {
        vanilla = {
          enable = true;
          version = "1.21.11";
        };
      };
    };
  };
}
