{pkgs, ...}: {
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    displayManager.startx.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm/dwm;
        patches = [
          ./dwm/dwm/patches/nodmenu.patch
          (pkgs.fetchpatch {
            url = "https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.4.diff";
            hash = "sha256-+OXRqnlVeCP2Ihco+J7s5BQPpwFyRRf8lnVsN7rm+Cc=";
          })
          (pkgs.fetchpatch {
            url = "https://dwm.suckless.org/patches/systray/dwm-systray-20230922-9f88553.diff";
            hash = "sha256-Kh1aP1xgZAREjTy7Xz48YBo3rhrJngspUYwBU2Gyw7k=";
          })
          (pkgs.fetchpatch {
            url = "https://dwm.suckless.org/patches/cool_autostart/dwm-cool-autostart-20240312-9f88553.diff";
            hash = "sha256-pgXbgoAAewCjZP16smKkTVh5p7P/FK+Rue0F6gjmGVo=";
          })
        ];
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common.default = ["gtk"];
    };
  };

  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = ./dwm/st;
      patches = [];
    }))
    feh
    flameshot
    picom
    rofi
    xclip
  ];

  programs.slock.enable = true;
}
