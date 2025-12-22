{...}: {
  programs.git = {
    enable = true;
    config = {
      user.name = "lazikiri";
      user.email = "lazikiri@tuta.com";
      init.defaultBranch = "master";
    };
  };
}
