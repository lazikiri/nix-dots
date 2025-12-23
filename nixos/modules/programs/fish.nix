{pkgs, ...}: {
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    eza
    fastfetch
    fzf
    zoxide
  ];
}
