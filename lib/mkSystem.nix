{ nixpkgs
, inputs
}:

name:
{ system
, user
}:

let
  machineConfig = ../host;
  userOSConfig = ../modules/nixos;
  userHMConfig = ../modules/home-manager;

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;

  modules = [
    machineConfig
    userOSConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig;
    }
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
        inputs = inputs;
      };
    }
  ];
}
