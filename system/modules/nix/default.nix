{...}: {
  imports = [
    ./nh.nix
    ./substituters.nix
  ];
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      builders-use-substitutes = true;
      trusted-users = ["root" "@wheel"];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
