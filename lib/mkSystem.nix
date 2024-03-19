{ nixpkgs, inputs, overlays }:

name:
{ system, user }:

let
  hostConfig = ../hosts/${name};
  userOSConfig = ../modules/nixos;
  userHMConfig = ../modules/home-manager;

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in systemFunc rec {
  inherit system;

  specialArgs = {
    inherit system inputs user;
    root = ../.;
  };

  modules = [
    {
      nixpkgs = {
        overlays = overlays;
        config.allowUnfree = true;
      };
    }
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
