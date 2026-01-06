{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gpu-recorder.enable = lib.mkEnableOption "Enable Gpu-screen-recorder";

  config = lib.mkIf config.gpu-recorder.enable {
    programs.gpu-screen-recorder = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      gpu-screen-recorder-gtk
    ];
  };
}
