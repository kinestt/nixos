{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [ 
	./laptop/configuration.nix
        home-manager.nixosModules.home-manager 
        {
          home-manager = {
 	    useGlobalPkgs = true;
            useUserPackages = true;
            users.kin = ./laptop/home-manager/home.nix;
          };
        }
      ];
    };
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      modules = [
        ./server/configuration.nix
      ];
    };
  };
}
