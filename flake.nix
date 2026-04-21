{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      url = "git+ssh://git@github.com/kinestt/nix-secrets?ref=main&shallow=1";
      flake = false;
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
    };

    nixcraft = {
      url = "github:loystonpais/nixcraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixflix = {
      url = "github:kiriwalawren/nixflix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=offline-install-onactivation-1";
  };
  outputs = { self, nixpkgs, home-manager, nix-secrets, sops-nix, nvf, nix-flatpak, nixcord, nixflix, nixcraft }@inputs: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      modules = [ 
        ./laptop/configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
    nixosConfigurations.server = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./server/configuration.nix
        sops-nix.nixosModules.sops
        nixflix.nixosModules.default
      ];
    };
    homeConfigurations.kin-laptop = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        nixcord.homeModules.nixcord
        nixcraft.homeModules.default
        nvf.homeManagerModules.default
        ./laptop/home-manager/home.nix
      ];
    };
    homeConfigurations.kin-server = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        ./server/home-manager/home.nix
        sops-nix.homeManagerModules.sops
        nixcraft.homeModules.default
      ];
    };
  };
}
