{
  services.recyclarr = {
    enable = true;
    configuration = builtins.fromJSON (builtins.readFile ./recyclarr.json);
  };
}
