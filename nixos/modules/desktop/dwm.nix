{pkgs, ...}: {
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    displayManager.startx.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./dwm;
        patches = [
          ./dwm/patches/nodmenu.patch
        ];
      };
    };
  };

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
    dmenu
    picom
    rofi
    st
    xclip
  ];
}
