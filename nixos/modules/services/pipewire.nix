{
  lib,
  config,
  ...
}: {
  options.pipewire.enable = lib.mkEnableOption "Enable Pipewire";

  config = lib.mkIf config.pipewire.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
