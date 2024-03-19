{ config, pkgs, ... }:
let
  screenshotarea = "grimblast --notify --freeze copy area";

  workspaces = builtins.concatLists (builtins.genList (x:
    let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
    in [
      "SUPER, ${ws}, workspace, ${toString (x + 1)}"
      "SUPERSHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
    ]) 10);

  # Get default application
  terminal = config.home.sessionVariables.TERMINAL;
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        # Compositor commands
        "SUPERSHIFT, C, killactive"
        "SUPER, F, fullscreen"
        "SUPER, Space, togglefloating"

        # Grouped (tabbed) windows
        "SUPER, G, togglegroup"
        "SUPER, TAB, changegroupactive, f"
        "SUPERSHIFT, TAB, changegroupactive, b"

        # Move focus
        "SUPER, j, layoutmsg, cyclenext"
        "SUPER, k, layoutmsg, cycleprev"

        # Move windows
        "SUPERSHIFT, j, layoutmsg, swapnext"
        "SUPERSHIFT, k, layoutmsg, swapprev"

        # Cycle through workspaces
        "SUPERALT, up, workspace, m-1"
        "SUPERALT, down, workspace, m+1"

        # Utilities
        "SUPER, Return, exec, ${terminal}"
        "SUPER, L, exec, hyprlock"

        # Screenshot
        ", Print, exec, ${screenshotarea}"

        #Picker
        "SUPER, P, exec, hyprpicker | wl-copy"

        #Swaync
        "SUPER, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw"

        # Launchers
        "SUPER, D, exec, anyrun"
      ] ++ workspaces;

      binde = [
        # Audio
        "SUPER ,V , exec, volumectl up 5"
        "SUPERSHIFT ,V, exec, volumectl down 5"
        "SUPER ,M , exec, ${pkgs.pamixer}/bin/pamixer --default-source --toggle-mute"
      ];

      # Mouse bindings
      bindm =
        [ "SUPER, mouse:272, movewindow" "SUPER, mouse:273, resizewindow" ];
    };

    extraConfig = ''
      bind = SUPERSHIFT, S, submap, resize

      submap = resize
      binde = SUPERSHIFT, l, resizeactive, 20 0
      binde = SUPERSHIFT, h, resizeactive, -20 0
      binde = SUPERSHIFT, k, resizeactive, 0 -20
      binde = SUPERSHIFT, j, resizeactive, 0 20
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}

