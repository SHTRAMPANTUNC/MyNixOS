{ pkgs
, config
, ...
}:

{
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 30;
        package =
          pkgs.runCommand "moveUp" { } ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchzip {
              url = url;
              hash = hash;
            }} $out/share/icons/${name}
          '';
      };
    in

    getFrom
      "https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-Monterey.tar.gz"
      "sha256-MHmaZs56Q1NbjkecvfcG1zAW85BCZDn5kXmxqVzPc7M="
      "MacOS-Monterey";

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Green-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "green" ];
        size = "compact";
        tweaks = [ "rimless" "normal" ];
        variant = "mocha";
      };
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
  };

  qt = {
    enable = true;
    style = {
      name = "catppuccin-kvantum";
      package = pkgs.catppuccin-kvantum;
    };
    platformTheme = "gtk3";
  };
}
