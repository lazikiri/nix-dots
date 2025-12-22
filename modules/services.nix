{
  config,
  pkgs,
  ...
}: {
  services = {
    auto-cpufreq.enable = true;

    flatpak = {
      enable = true;
      update.onActivation = true;
      remotes = [
        {
          name = "flathub-beta";
          location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
        }
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "com.dec05eba.gpu_screen_recorder"
        "com.discordapp.Discord"
        "com.github.tchx84.Flatseal"
        "com.usebottles.bottles"
        "io.github.flattool.Warehouse"
        "io.github.lawstorant.boxflat"
        "org.vinegarhq.Sober"
      ];
    };

    getty.autologinUser = "user";

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    printing.enable = false;
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

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
  };
}
