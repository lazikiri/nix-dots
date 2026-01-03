{pkgs, ...}: {
  users.users.user = {
    isNormalUser = true;
    description = "User";
    extraGroups = ["networkmanager" "wheel" "openrazer" "plugdev"];
    shell = pkgs.fish;
  };
}
