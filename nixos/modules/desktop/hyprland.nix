{pkgs, ...}: {
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
    yazi
  ];

  programs.gtklock.enable = true;
}
