{
  inputs,
  user,
  stateVersion,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModule
    ./gui
    ./overlays
    ./programms
    ./wayland/windowManager
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
