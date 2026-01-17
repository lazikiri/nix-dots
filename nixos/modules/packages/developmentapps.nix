{
  pkgs,
  lib,
  config,
  ...
}: {
  options.developmentapps.enable = lib.mkEnableOption "Enable Development Apps";

  config = lib.mkIf config.developmentapps.enable {
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    tmux
    yazi
  ];
};
}
