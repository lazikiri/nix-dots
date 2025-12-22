{
  pkgs,
  ...
}: {
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = ["networkmanager" "wheel" "openrazer" "plugdev"];
    shell = pkgs.fish;
    packages = with pkgs; [
      alejandra
      btop
      lazygit
      ncdu
      nwg-look
      pkgs.nur.repos.forkprince.helium-nightly
      stow
      unp
      unzip
      brave

      # ----- DOTFILE STUFF BELOW -----
      # Hyprland
      adw-gtk3
      adwaita-icon-theme
      cliphist
      dunst
      gtklock
      hyprpolkitagent
      hyprshot
      kitty
      matugen
      quickshell
      rofi
      swww
      wiremix
      wl-clipboard
      yazi

      # Fish
      eza
      fastfetch
      fzf
      zoxide

      # Neovim
      neovim
      ripgrep

      mpv

      tmux
    ];
  };
  security = {
    sudo.wheelNeedsPassword = false;
    polkit.enable = true;
  };
}
