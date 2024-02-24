{ inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModule
    ./misc
    ./programms
  ];
}
