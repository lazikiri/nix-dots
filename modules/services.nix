{
  config,
  pkgs,
  ...
}: {
  services.auto-cpufreq.enable = true;

  services.flatpak = {
    enable = true;
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
      "com.discordapp.Discord"
      "com.github.tchx84.Flatseal"
      "com.usebottles.bottles"
      "io.github.flattool.Warehouse"
      "io.github.lawstorant.boxflat"
      "org.vinegarhq.Sober"
    ];
  };

  services.getty.autologinUser = "user";

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = false;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
  };
}
