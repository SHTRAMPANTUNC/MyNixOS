{ inputs, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModule
    ./misc
    ./media
    ./browser
    ./home.nix
    ./development
    ./command-line
  ];
}
