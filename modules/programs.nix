{
  config,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.git = {
    enable = true;
    # settings.user = {
    #   name = "lazikiri";
    #   email = "lazikiri@tuta.com";
    # };
  };
}
