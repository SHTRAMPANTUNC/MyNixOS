{ inputs, pkgs, config, ... }@vars:

{
  imports = [
    ./nixos
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      nixosArgs = vars;
    };
    users = {
      kuper = import ./home-manager;
    };
  };
}
