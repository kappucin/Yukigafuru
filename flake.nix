{

  description = "Yukigafuru | NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    niri.url = "github:sodiboo/niri-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self,

      nixpkgs, 
      disko, 
      home-manager, 
      niri, 
      chaotic,

      ... }@inputs: let

    system = "x86_64-linux";
    hostname = "sunofureku";

  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      
      specialArgs = {
        inherit inputs hostname;
        lib = nixpkgs.lib;
      };

      modules = [
        niri.nixosModules.niri
        inputs.disko.nixosModules.disko
        chaotic.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.kppcn = import ./home/main.nix;
            extraSpecialArgs = { inherit inputs; };
          };
        }

        ./nixosModules
      ];
    };
  };
}
