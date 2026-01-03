{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    # xlibre-overlay = {
    #   url = "git+https://codeberg.org/takagemacoed/xlibre-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ {
    nixpkgs,
    nur,
    nix-flatpak,
    # xlibre-overlay,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/hosts/laptop/configuration.nix
        nur.modules.nixos.default
        nur.legacyPackages."x86_64-linux".repos.iopq.modules.xraya
        nix-flatpak.nixosModules.nix-flatpak
        # inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
        # inputs.xlibre-overlay.nixosModules.overlay-all-xlibre-drivers
      ];
    };
  };
}
