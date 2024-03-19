{ config, pkgs, inputs, lib, ... }:

let
  _ = lib.getExe;
  volumectl = let inherit (pkgs) libnotify pamixer libcanberra-gtk3;
  in pkgs.writeShellScriptBin "volumectl" ''
    #!/usr/bin/env bash

    case "$1" in
    up)
      ${_ pamixer} -i "$2"
      ;;
    down)
      ${_ pamixer} -d "$2"
      ;;
    toggle-mute)
      ${_ pamixer} -t
      ;;
    esac

    volume_percentage="$(${_ pamixer} --get-volume)"
    isMuted="$(${_ pamixer} --get-mute)"

    if [ "$isMuted" = "true" ]; then
      ${libnotify}/bin/notify-send --transient \
        -u normal \
        -a "VOLUMECTL" \
        -i audio-volume-muted-symbolic \
        "VOLUMECTL" "Volume Muted"
    else
      ${libnotify}/bin/notify-send --transient \
        -u normal \
        -a "VOLUMECTL" \
        -h string:x-canonical-private-synchronous:volumectl \
        -h int:value:"$volume_percentage" \
        -i audio-volume-high-symbolic \
        "VOLUMECTL" "Volume: $volume_percentage%"

      ${libcanberra-gtk3}/bin/canberra-gtk-play -i audio-volume-change -d "volumectl"
    fi
  '';

in {
  imports = [
    ./config
    ./anyrun
    ./waybar
    ./swaync

    ./hyprlock.nix
  ];
  home.packages = with pkgs; [
    dbus
    glib
    gtk3
    swww
    hyprpicker
    grimblast
    wl-clipboard
    xdg-utils

    # Custom Utilities
    volumectl
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.overHyprland;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
