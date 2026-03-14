{
  services.recyclarr = {
    enable = true;
    configuration = yaml.import ./data/recyclarr.yml;
  };
}
