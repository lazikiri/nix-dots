{
  pkgs,
  lib,
  config,
  ...
}: {
  options.desktopapps.enable = lib.mkEnableOption "Enable Desktop Apps";

  config = lib.mkIf config.desktopapps.enable {
    environment.systemPackages = with pkgs; [
      (discord.override {
        withVencord = true;
        withOpenASAR = true;
      })
      mpv
      easyeffects
      nautilus
      nwg-look
      brave
      pkgs.nur.repos.forkprince.helium-nightly
    ];
  };
}
