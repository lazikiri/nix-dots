{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-25_05.url = "nixpkgs/nixos-25.05";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-25_05,
    nur,
    nix-flatpak,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        stable-pkgs = nixpkgs-25_05.legacyPackages.x86_64-linux;
      };
      modules = [
        ./nixos/hosts/laptop/configuration.nix
        nur.modules.nixos.default
        nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}
