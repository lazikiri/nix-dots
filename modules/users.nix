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
      pkgs.lazygit
      pkgs.alejandra
      pkgs.ncdu
      pkgs.nur.repos.forkprince.helium-nightly
    ];
  };


security.sudo.wheelNeedsPassword = false;
}
