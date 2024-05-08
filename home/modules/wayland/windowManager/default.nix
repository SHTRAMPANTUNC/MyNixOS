{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hyprlock.nix
    ./hypridle.nix
    ./config
    ./waybar
    ./swaync
    ./rofi
  ];
  home.packages = with pkgs; [
    imv
    gtk3
    dbus
    glib
    swww
    cliphist
    hyprpicker
    grimblast
    xdg-utils
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
