{
  pkgs,
  root,
  ...
}: let
  Vesktop = pkgs.callPackage "${root}/home/overlays/vesktop.nix" {};
in {
  imports = [(import ./theme.nix)];
  home.packages = with pkgs; [Vesktop];
}
