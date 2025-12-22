{pkgs, ...}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.file.".config/gtk-3.0".source = ./config/gtk-3.0;
  home.file.".config/gtk-4.0".source = ./config/gtk-4.0;
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/matugen".source = ./config/matugen;
  home.file.".config/quickshell".source = ./config/quickshell;
  home.file.".config/rofi".source = ./config/rofi;

  home.packages = with pkgs; [
    alejandra
    btop
    lazygit
    ncdu
    nwg-look
    pkgs.nur.repos.forkprince.helium-nightly
    unp
    unzip
    brave

    # ----- DOTFILE STUFF BELOW -----
    # Hyprland
    adw-gtk3
    adwaita-icon-theme
    cliphist
    dunst
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

  home.stateVersion = "25.11";
}
