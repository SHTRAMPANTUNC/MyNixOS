{ pkgs, config, ... }:

{
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
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
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
