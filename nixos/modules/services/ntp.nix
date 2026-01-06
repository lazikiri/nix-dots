{
  lib,
  config,
  ...
}: {
  options.ntp.enable = lib.mkEnableOption "Enable Ntp";

  config = lib.mkIf config.ntp.enable {
    services.ntp.enable = true;
  };
}
