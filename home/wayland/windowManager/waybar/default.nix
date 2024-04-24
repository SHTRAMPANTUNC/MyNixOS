{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";

    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = [
          "tray"
          "pulseaudio"
          "hyprland/language"
          "custom/notification"
        ];

        # Logo
        "custom/nixlogo" = {
          format = " ";
          tooltip = false;
        };

        # Workspaces
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          persistent-workspaces = {"*" = 5;};
        };

        # Clock & Calendar
        clock = {
          format = "{:%a %b %d, %H:%M}";
          on-click = "${pkgs.eww}/bin/eww update showcalendar=true";
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
        };

        # Tray
        tray = {
          icon-size = 24;
          show-passive-items = true;
          spacing = 8;
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "US";
          format-ru = "RU";
        };

        # Notifications
        "custom/notification" = {
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          return-type = "json";
          format = "{icon}";
          format-icons = {
            notification = "󰂚";
            none = "󰂜";
            dnd-notification = "󰂛";
            dnd-none = "󰪑";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          # on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          # on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          escape = true;
        };

        # Pulseaudio
        pulseaudio = {
          format = "{volume} {icon} / {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-muted = "󰖁 / {format_source}";
          format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          on-scroll-up = "${pkgs.pamixer}/bin/pamixer --decrease 1";
          on-scroll-down = "${pkgs.pamixer}/bin/pamixer --increase 1";
          tooltip = false;
        };
      }
    ];

    style = builtins.readFile (./. + "/style.css");
  };
}
