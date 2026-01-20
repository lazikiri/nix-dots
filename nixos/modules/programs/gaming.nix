{
  pkgs,
  stable-pkgs,
  lib,
  config,
  ...
}: {
  options.gaming.enable = lib.mkEnableOption "Enable Gaming";

  config = lib.mkIf config.gaming.enable {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      protontricks = {
        enable = true;
        package = stable-pkgs.protontricks;
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    services.udev.extraRules = ''
      SUBSYSTEM=="tty", KERNEL=="ttyACM*", ATTRS{idVendor}=="346e", ACTION=="add", MODE="0666", TAG+="uaccess"
    '';
  };
}
