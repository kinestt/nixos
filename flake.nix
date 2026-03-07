{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };
  outputs = { self, nixpkgs, home-manager, nixvim }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [ 
	./laptop/configuration.nix
      ];
    };
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      modules = [
        ./server/configuration.nix
      ];
    };
    homeConfigurations.kin = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./laptop/home-manager/home.nix
      ];
    };
  };
}
