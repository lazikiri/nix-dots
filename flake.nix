{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = {
    nixpkgs,
    nur,
    nix-flatpak,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/hosts/laptop/configuration.nix
        nur.modules.nixos.default
        nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
        nix-flatpak.nixosModules.nix-flatpak
      ];
    };
  };
}
