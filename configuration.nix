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

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Nassau";
  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.fira-code
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
}
