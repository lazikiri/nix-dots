{
  config,
  pkgs,
  # nur,
  ...
}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neovim
    tmux
    alejandra
    ncdu
    brave
    quickshell
    rofi
    kitty
    lazygit
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "lazikiri";
      email = "lazikiri@tuta.com";
    };
  };
}
