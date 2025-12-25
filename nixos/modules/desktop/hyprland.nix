{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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
    adw-gtk3
    adwaita-icon-theme
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
    yazi
  ];

  programs.gtklock.enable = true;
}
