{ nixpkgs
, inputs
}:

name:
{ system
, user
}:

let
  machineConfig = ../host/${name};
  userOSConfig = ../modules/${user}/nixos;
  userHMConfig = ../modules/${user}/home-manager;

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;

  specialArgs = {
    inherit system inputs user;
    root = ../.;
  };

  modules = [
    machineConfig
    userOSConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig;
      home-manager.extraSpecialArgs = {
        inherit system inputs user;
        root = ../.;
      };
    }
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
      };
    }
  ];
}
