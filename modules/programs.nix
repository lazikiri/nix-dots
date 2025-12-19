{
  config,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;

  programs.fish = {
    enable = true;
  };

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
}
