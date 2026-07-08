{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.searxng = {config, ...}: {
    sops.secrets = {
      "searxng/secret_key" = {};
    };

    services.searx = {
      enable = true;
      settings = {
        server = {
          port = 8080;
          secret_key = config.sops.secrets."searxng/secret_key".path;
        };
        search = {
          autocomplete = "google";
        };
        ui = {
          url_formatting = "host";
          center_alignment = true;
          results_on_new_tab = true;
        };
        hostnames = {
          replace = {
            "(.*\.)?reddit\.com$" = "redlib.server.org";
            "(.*\.)?youtube\.com$" = "piped.server.org";
            "(.*\.)?youtu\.be$" = "piped.server.org";
          };
        };
      };
      domain = "search.server.org";
      configureNginx = true;
    };
  };
}
