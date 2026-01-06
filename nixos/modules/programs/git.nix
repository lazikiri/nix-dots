{
  lib,
  config,
  ...
}: {
  options.git.enable = lib.mkEnableOption "Enable Git";

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      config = {
        user.name = "lazikiri";
        user.email = "lazikiri@tuta.com";
        init.defaultBranch = "master";
      };
    };
  };
}
