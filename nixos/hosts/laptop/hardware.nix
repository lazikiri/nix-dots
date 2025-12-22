{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
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
    ];
    kernelModules = [
      "ec_sys"
      "msi_ec"
    ];
  };
}
