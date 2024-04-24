{
  inputs,
  stateVersion,
  ...
}: {
  mkHome = {
    user,
    platform ? "x86_64-linux",
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${platform};
      extraSpecialArgs = {
        inherit inputs platform user stateVersion;
        root = ../.;
      };

      modules = [
        ../home
      ];
    };

  mkHost = {
    hostname,
    user,
    platform ? "x86_64-linux",
  }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs hostname user platform stateVersion;
        root = ../.;
      };

      modules = [
        ../system
      ];
    };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "i686-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
