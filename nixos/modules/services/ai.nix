{
  pkgs,
  lib,
  config,
  ...
}: {
  options.ai.enable = lib.mkEnableOption "Enable AI";

  config = lib.mkIf config.ai.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };

    services.open-webui = {
      enable = true;
      port = 8080;
    };
  };
}
