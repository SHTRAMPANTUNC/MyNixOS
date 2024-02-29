{ nixpkgs
, inputs
, overlays
}:

name:
{ system
, user
}:

let
  hostConfig = ../hosts/${name};
  userOSConfig = ../users/${user}/nixos;
  userHMConfig = ../users/${user}/home-manager;

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
    { nixpkgs.overlays = overlays; }

    hostConfig
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
