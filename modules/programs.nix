{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
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

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
