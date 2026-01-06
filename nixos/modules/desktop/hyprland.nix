{
  pkgs,
  lib,
  config,
  ...
}: {
  options.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
      config = {
        common.default = ["gtk"];
        hyprland = {
          default = [
            "hyprland"
            "gtk"
          ];
        };
      };
    };

    environment.systemPackages = with pkgs; [
      cliphist
      dunst
      hyprpolkitagent
      hyprshot
      kitty
      matugen
      quickshell
      rofi
      swww
      wiremix
      wl-clipboard
    ];

    programs.gtklock.enable = true;
  };
}
