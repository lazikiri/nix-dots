{
  config,
  pkgs,
  ...
}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
  ];

  programs.fish.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "lazikiri";
      email = "lazikiri@tuta.com";
    };
  };
}
