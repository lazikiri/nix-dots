{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./../../modules/zram/zram.nix
    ./../../modules/services/auto-cpufreq.nix
    ./../../modules/services/flatpak.nix
    ./../../modules/services/getty.nix
    ./../../modules/services/pipewire.nix
    ./../../modules/services/printing.nix
    ./../../modules/desktop/hyprland.nix
    ./../../modules/programs/fish.nix
    ./../../modules/programs/gamemode.nix
    ./../../modules/programs/git.nix
    ./../../modules/programs/steam.nix
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
