{ pkgs
, inputs
, config
, root
, user
, ...
}:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${root}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
  };

  users.users.${user}.extraGroups = [ config.users.groups.keys.name ];
}
