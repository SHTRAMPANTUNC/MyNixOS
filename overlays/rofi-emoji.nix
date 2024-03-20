{pkgs, ...}:
pkgs.rofi-emoji.overrideAttrs (oldAttrs: rec {
  buildInputs = with pkgs; [
    rofi-wayland-unwrapped
    cairo
    glib
    libnotify
    wl-clipboard
    xclip
    xsel
  ];
})
