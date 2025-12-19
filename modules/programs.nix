{
  config,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.gamemode.enable = true;

  programs.git = {
    enable = true;
    config = {
      user.name = "lazikiri";
      user.email = "lazikiri@tuta.com";
      init.defaultBranch = "master";
    };
  };
}
