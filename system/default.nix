{
  lib,
  hostname,
  platform,
  stateVersion ? null,
  ...
}: {
  imports =
    []
    ++ lib.optional (builtins.pathExists (./. + "/hosts/${hostname}")) ./hosts/${hostname};

  system.stateVersion = stateVersion;

  nixpkgs.hostPlatform = platform;
}
