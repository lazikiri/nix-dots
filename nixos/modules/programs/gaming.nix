{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gaming.enable = lib.mkEnableOption "Enable Gaming";

  config = lib.mkIf config.gaming.enable {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
