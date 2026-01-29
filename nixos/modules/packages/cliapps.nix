{
  pkgs,
  lib,
  config,
  ...
}: {
  options.cliapps.enable = lib.mkEnableOption "Enable Cli Apps";

  config = lib.mkIf config.cliapps.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      lazygit
      ncdu
      stow
      unp
      unzip
    ];
  };
}
