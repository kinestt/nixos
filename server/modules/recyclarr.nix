{
  services.recyclarr = {
    enable = true;
    configuration = builtins.fromJSON (builtins.readFile /home/kin/recyclarr.json);
  };
}
