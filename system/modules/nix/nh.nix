{...}: {
  # nh default flake
  environment.variables.FLAKE = "/home/kuper/MyNixOS";

  programs.nh = {
    enable = true;
    # weekly cleanup
    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
