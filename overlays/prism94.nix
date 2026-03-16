final: prev:
let
  oldPkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/e6f23dc08d3624daab7094b701aa3954923c6bbb.tar.gz";
  }) {
    system = prev.system;
  };
in {
  prismlauncher-9 = oldPkgs.prismlauncher;
}
