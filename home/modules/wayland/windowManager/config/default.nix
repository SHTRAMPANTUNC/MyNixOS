{
  config,
  root,
  ...
}: let
  pointer = config.home.pointerCursor;
in {
  imports = [
    ./binds.nix
    ./rules.nix
  ];
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;

      bezier = ["md3_decel, 0.05, 0.7, 0.1, 1" "workspace,0.17, 1.17, 0.3,1"];

      animation = [
        "border, 1, 2, default"
        "fade, 1, 2, md3_decel"
        "windows, 1, 4, md3_decel, popin 60%"
        "workspaces, 1, 5, workspace, slidefadevert 8%"
      ];
    };

    decoration = {
      rounding = 3;

      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      drop_shadow = false;

      blur = {
        enabled = true;
        passes = 3;
        size = 16;
      };
    };

    workspace = [
      "1, monitor:DP-1, default:true"
      "2, monitor:HDMI-A-1, default:true"
      "3, monitor:HDMI-A-1, default:true"
      "4, monitor:HDMI-A-1, default:true"
      "5, monitor:DP-1, default:true"
    ];

    exec-once = [
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"

      "swww init & sleep 0.5 && exec swww img ${root}/assets/walls/014.jpg --transition-type simple"
    ];

    env = [
      "HYPRCURSOR_THEME,${pointer.name}"
      "HYPRCURSOR_SIZE,${toString pointer.size}"
    ];

    general = {
      gaps_in = 12;
      gaps_out = 20;
      border_size = 3;
      "col.inactive_border" = "rgba(181825ee)";
      "col.active_border" = "rgba(89b4faee)";
      layout = "master";
    };

    input = {
      kb_layout = "us,ru";
      kb_options = "caps:none, grp:alt_shift_toggle";
      accel_profile = "flat";
      sensitivity = 0.0;
    };

    misc = {
      disable_autoreload = false;
      disable_hyprland_logo = true;
      focus_on_activate = true;
      force_default_wallpaper = 0;
    };

    monitor = ["DP-1,2560x1440@165,0x0,1" "HDMI-A-1,1920x1080@144,2560x0,1"];
  };
}
