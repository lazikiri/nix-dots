{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./fonts.nix
    ./packages.nix

    ./../../modules/zram/zram.nix

    ./../../modules/services/auto-cpufreq.nix
    ./../../modules/services/flatpak.nix
    ./../../modules/services/getty.nix
    ./../../modules/services/ntp.nix
    ./../../modules/services/pipewire.nix
    # ./../../modules/services/printing.nix

    # ./../../modules/desktop/dwm.nix
    ./../../modules/desktop/hyprland.nix

    ./../../modules/programs/fish.nix
    ./../../modules/programs/gaming.nix
    ./../../modules/programs/git.nix
    # ./../../modules/programs/nix-ld.nix

    ./../../modules/packages/browsers.nix
    ./../../modules/packages/cli.nix
    ./../../modules/packages/desktopapps.nix
    ./../../modules/packages/development.nix
    ./../../users/users.nix
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

  security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11";
}
