{ inputs
, pkgs
, ...
}:

{
  imports = [
    inputs.spicetify-nix.homeManagerModule
    ./misc
    ./programms
  ];

  home = {
    username = "kuper";
    homeDirectory = "/home/kuper";
    stateVersion = "24.05";
    packages = with pkgs; [
      vesktop
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
