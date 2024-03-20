{pkgs, ...}:
pkgs.rofi-calc.overrideAttrs (oldAttrs: rec {
  buildInputs = with pkgs; [rofi-wayland-unwrapped libqalculate glib cairo];
})
