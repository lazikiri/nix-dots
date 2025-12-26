{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adw-gtk3
    adwaita-icon-theme
  ];
}
