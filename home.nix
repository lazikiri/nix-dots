{
  config,
  pkgs,
  ...
}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    ripgrep

    tmux

    quickshell
    kitty
    rofi
    swww
    wiremix
    dunst
    matugen
    hyprpolkitagent
    nerd-fonts.fira-code
    adw-gtk3
    adwaita-icon-theme
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "lazikiri";
      email = "lazikiri@tuta.com";
    };
  };
}
