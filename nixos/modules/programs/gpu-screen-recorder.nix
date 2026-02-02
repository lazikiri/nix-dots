{
  pkgs,
  lib,
  config,
  ...
}: {
  options.gpu-screen-recorder.enable = lib.mkEnableOption "Enable Gpu-screen-recorder";

  config = lib.mkIf config.gpu-screen-recorder.enable {
    programs.gpu-screen-recorder = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      gpu-screen-recorder-gtk
    ];
  };
}
