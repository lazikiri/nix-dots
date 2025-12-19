{
  config,
  pkgs,
  ...
}: {
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.fish;
    packages = with pkgs; [
      alejandra
      lazygit
      ncdu
      nwg-look
      pkgs.nur.repos.forkprince.helium-nightly
      stow

      # DOTFILE STUFF BELOW
      # Hyprland
      adw-gtk3
      hyprshot
      adwaita-icon-theme
      cliphist
      dunst
      gtklock
      hyprpolkitagent
      kitty
      matugen
      nerd-fonts.fira-code
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
  security.sudo.wheelNeedsPassword = false;
}
