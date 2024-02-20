{ inputs
, pkgs
, config
, user
, ...
}@vars:

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
      ${user} = import ./home-manager;
    };
  };
}
