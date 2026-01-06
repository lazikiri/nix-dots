{
  lib,
  config,
  ...
}: {
  options.getty.enable = lib.mkEnableOption "Enable Getty";

  config = lib.mkIf config.getty.enable {
    services.getty.autologinUser = "user";
  };
}
