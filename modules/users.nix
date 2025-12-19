{
  config,
  pkgs,
  nur,
  ...
}: {
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
      pkgs.nur.repos.forkprince.helium-nightly
      pkgs.lazygit
      pkgs.alejandra
      pkgs.ncdu
      pkgs.nwg-look
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
