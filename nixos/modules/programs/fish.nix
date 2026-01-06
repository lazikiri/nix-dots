{
  pkgs,
  lib,
  config,
  ...
}: {
  options.fish.enable = lib.mkEnableOption "Enable Fish";

  config = lib.mkIf config.fish.enable {
    programs.fish.enable = true;

    environment.systemPackages = with pkgs; [
      eza
      fastfetch
      fzf
      zoxide
    ];
  };
}
