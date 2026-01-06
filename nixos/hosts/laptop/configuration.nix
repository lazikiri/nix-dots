{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./fonts.nix
    ./packages.nix

    ./../../modules/zram/zram.nix

    ./../../modules/services/default.nix
    ./../../modules/desktop/default.nix
    ./../../modules/programs/default.nix

    ./../../modules/packages/browsers.nix
    ./../../modules/packages/cli.nix
    ./../../modules/packages/desktopapps.nix
    ./../../modules/packages/development.nix

    ./../../users/users.nix
  ];

  ai.enable = true;
  cpufreq.enable = true;
  flatpak.enable = true;
  getty.enable = false;
  ntp.enable = true;
  pipewire.enable = true;
  printing.enable = false;

  hyprland.enable = true;
  dwm.enable = false;
  plasma.enable = false;

  fish.enable = true;
  gaming.enable = true;
  git.enable = true;
  gpu-recorder.enable = true;
  nix-ld.enable = true;

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
