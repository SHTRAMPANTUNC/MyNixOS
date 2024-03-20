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
          "group/audio-slider"
          "hyprland/language"
          "tray"
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
          persistent-workspaces = {"*" = 4;};
        };

        # Clock & Calendar
        clock = {
          format = "{:%a %b %d, %H:%M}";
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            format = {
              days = "<span color='#98989d'><b>{}</b></span>";
              months = "<span color='#ffffff'><b>{}</b></span>";
              today = "<span color='#ffffff'><b><u>{}</u></b></span>";
              weekdays = "<span color='#0a84ff'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
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
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          tooltip = true;
          escape = true;
        };

        # Pulseaudio
        "group/audio-slider" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "audio-slider-child";
            transition-left-to-right = true;
          };
          modules = ["pulseaudio" "pulseaudio/slider"];
        };
        pulseaudio = {
          format = "{icon} / {format_source}";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-muted = "󰖁";
          format-icons = {default = ["󰕿" "󰖀" "󰕾"];};
          tooltip-format = "Volume: {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          on-scroll-up = "${pkgs.pamixer}/bin/pamixer --decrease 1";
          on-scroll-down = "${pkgs.pamixer}/bin/pamixer --increase 1";
        };
        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };
      }
    ];

    style = builtins.readFile (./. + "/style.css");
  };
}
