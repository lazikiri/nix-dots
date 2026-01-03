{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    mpv
    easyeffects
    nautilus
    nwg-look
  ];
}
