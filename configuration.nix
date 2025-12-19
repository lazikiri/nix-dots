{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/users.nix
    ./modules/drivers.nix
    ./modules/services.nix
    ./modules/programs.nix
    ./modules/packages.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
}
