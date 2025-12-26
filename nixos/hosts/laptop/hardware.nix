{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["modesetting" "nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
    mcontrolcenter
  ];

  boot = {
    extraModulePackages = [config.boot.kernelPackages.msi-ec];
    kernelParams = [
      "ec_sys.write_support=1"
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
    ];
    kernelModules = [
      "ec_sys"
      "msi_ec"
    ];
  };
}
