{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.localCA = {
    security.pki.certificateFiles = [
      ./certs/rootCA.pem
    ];
  };
}
