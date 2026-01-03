{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    btop
    lazygit
    ncdu
    stow
    unp
    unzip
  ];
}
