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

  services.flatpak.enable = true;
}
