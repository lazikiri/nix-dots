{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    brave
    pkgs.nur.repos.forkprince.helium-nightly
  ];
}
