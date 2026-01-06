{
  lib,
  config,
  ...
}: {
  options.cpufreq.enable = lib.mkEnableOption "Enable Auto-cpufreq";

  config = lib.mkIf config.cpufreq.enable {
    services.auto-cpufreq.enable = true;
  };
}
