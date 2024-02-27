{ inputs
, pkgs
, user
, ...
}:

{
  imports = [
    inputs.spicetify-nix.homeManagerModule
    ./misc
    ./programms
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "24.05";
    packages = with pkgs; [
      obsidian
      tdesktop
    ];
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };
}
