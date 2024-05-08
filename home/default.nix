{
  lib,
  user,
  stateVersion,
  ...
}: let
  isRoot =
    if (user == "root")
    then true
    else false;
  homeDirectory =
    if isRoot
    then "/root"
    else "/home/${user}";
in {
  programs.home-manager.enable = true;

  imports =
    []
    ++ lib.optional (builtins.pathExists (./. + "/users/${user}")) ./users/${user};

  home = {
    username = user;
    stateVersion = stateVersion;
    homeDirectory = homeDirectory;
  };
}
