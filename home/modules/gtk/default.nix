{pkgs, ...}: {
  imports = [./cursor.nix];
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        size = "compact";
        tweaks = ["rimless" "normal"];
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
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-error-bell = 0;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-error-bell = 0;
    };
  };
}
