{
  nixpkgs.overlays = [
    (final: prev:
      let
        pkgs94 = import (builtins.fetchTarball{
          url = "https://github.com/NixOS/nixpkgs/archive/e6f23dc08d3624daab7094b701aa3954923c6bbb.tar.gz";
          sha256 = "sha256:0m0xmk8sjb5gv2pq7s8w7qxf7qggqsd3rxzv3xrqkhfimy2x7bnx";
        }) {
          system = prev.system;
        };
      in {
        prismlauncher-9 = pkgs94.prismlauncher;
      })
    ];
};


