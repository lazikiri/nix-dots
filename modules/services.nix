{
  config,
  pkgs,
  ...
}: {
  services.getty.autologinUser = "user";

  services.printing.enable = false;

  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
      "io.github.flattool.Warehouse"
      "io.github.lawstorant.boxflat"
      "org.vinegarhq.Sober"
    ];
  };
}
