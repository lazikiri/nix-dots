{
  lib,
  config,
  ...
}: {
  options.ai.enable = lib.mkEnableOption "Enable AI";

  config = lib.mkIf config.ai.enable {
    services.ollama.enable = true;
  };
}
