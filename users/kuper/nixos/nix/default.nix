{ ... }:
{
  imports = [
    ./nixpkgs.nix
  ];
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };
}
