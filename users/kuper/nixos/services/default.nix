{ ... }:
{
  imports = [
    ./xorg.nix
    ./auth.nix
    ./sound.nix
    ./docker.nix
    ./greetd.nix
    ./bluetooth.nix
  ];
}
