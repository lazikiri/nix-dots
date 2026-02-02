{
  lib,
  config,
  ...
}: {
  options.flatpak.enable = lib.mkEnableOption "Enable Flatpak";

  config = lib.mkIf config.flatpak.enable {
    services.flatpak = {
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
        "com.github.tchx84.Flatseal"
        "com.usebottles.bottles"
        "io.github.flattool.Warehouse"
        "io.github.lawstorant.boxflat"
        "org.telegram.desktop"
        "org.vinegarhq.Sober"
      ];
    };
  };
}
