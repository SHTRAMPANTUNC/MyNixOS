{
  pkgs,
  inputs,
  config,
  root,
  user,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  sops = {
    defaultSopsFile = "${root}/hosts/secrets.yaml";
    defaultSopsFormat = "yaml";
    age = {keyFile = "/home/${user}/.config/sops/age/keys.txt";};
    secrets = {
      password.neededForUsers = true;
      wg_private.owner = user;
      wg_preshared.owner = user;
    };
  };

  users.users.${user}.extraGroups = [config.users.groups.keys.name];
}
