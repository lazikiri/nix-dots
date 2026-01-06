{
  pkgs,
  lib,
  config,
  ...
}: {
  options.plasma.enable = lib.mkEnableOption "Enable Plasma";

  config = lib.mkIf config.plasma.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
