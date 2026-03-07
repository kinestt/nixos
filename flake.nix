{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=offline-install-onactivation-1";
  };
  outputs = { self, nixpkgs, home-manager, nixvim, nix-flatpak }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [ 
	./laptop/configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
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
