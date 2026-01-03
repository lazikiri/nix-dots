{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    tmux
    yazi
  ];
}
