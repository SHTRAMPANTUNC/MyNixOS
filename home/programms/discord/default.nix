{
  pkgs,
  root,
  ...
}: let
  Vesktop = pkgs.callPackage "${root}/pkgs/vesktop" {};
in {
  imports = [(import ./theme.nix)];
  home.packages = with pkgs; [Vesktop];
}
