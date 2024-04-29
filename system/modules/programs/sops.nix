{
  inputs,
  config,
  root,
  ...
}: let
  homeDir = config.home-manager.home.homeDirectory;
in {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = "${root}/secrets/secrets.yaml";
    age = {
      keyFile = "${homeDir}/.config/sops/age/keys.txt";
      generateKey = true;
    };
  };
}
