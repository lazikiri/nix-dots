{...}: {
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
      "com.dec05eba.gpu_screen_recorder"
      "com.github.tchx84.Flatseal"
      "com.usebottles.bottles"
      "io.github.flattool.Warehouse"
      "io.github.lawstorant.boxflat"
      "org.vinegarhq.Sober"
      "io.github.kukuruzka165.materialgram"
    ];
  };
}
