{
  inputs,
  root,
  user,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];
  sops = {
    defaultSopsFile = "${root}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/${user}/.config/sops/age/keys.txt";
      generateKey = false;
    };
    secrets.gh_key = {};
  };
}
