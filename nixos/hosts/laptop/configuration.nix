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
    ./../../modules/packages/default.nix
    ./../../users/users.nix
  ];

  ai.enable = false;
  cpufreq.enable = true;
  flatpak.enable = true;
  getty.enable = true;
  ntp.enable = true;
  pipewire.enable = true;
  printing.enable = false;

  hyprland.enable = true;
  dwm.enable = false;
  plasma.enable = false;

  fish.enable = true;
  gaming.enable = true;
  git.enable = true;
  gpu-screen-recorder.enable = false;
  nix-ld.enable = false;

  cliapps.enable = true;
  desktopapps.enable = true;
  developmentapps.enable = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "true";
      # DNSOverTLS = "true";
      DNS = ["1.1.1.1" "2606:4700:4700::1111"];
      # DNS = ["9.9.9.9" "2620:fe::fe"];
    };
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
