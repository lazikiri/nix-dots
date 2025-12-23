{pkgs, ...}: {
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = ["networkmanager" "wheel" "openrazer" "plugdev"];
    shell = pkgs.fish;

    packages = with pkgs; [
      alejandra
      brave
      btop
      lazygit
      ncdu
      nwg-look
      pkgs.nur.repos.forkprince.helium-nightly
      unp
      unzip
      stow

      # Neovim
      neovim
      ripgrep

      mpv

      tmux
    ];
  };
}
