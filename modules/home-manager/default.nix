{
  inputs,
  pkgs,
  user,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    inputs.sops-nix.homeManagerModules.sops
    ./config
    ./programms
    ./wayland/windowManager
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
