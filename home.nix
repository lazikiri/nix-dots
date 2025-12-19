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
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "lazikiri";
      email = "lazikiri@tuta.com";
    };
  };
}
