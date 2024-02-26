{ inputs
, pkgs
, config
, user
, ...
}@vars:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nixos
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs;
      nixosArgs = vars;
    };
    users = {
      ${user} = import ./home-manager;
    };
  };
}
