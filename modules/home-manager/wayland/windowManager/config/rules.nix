{ lib, ... }: {
  wayland.windowManager.hyprland.settings = {
    # layer rules
    layerrule = let
      toRegex = list:
        let elements = lib.concatStringsSep "|" list;
        in "^(${elements})$";

      layers = [
        "anyrun"
        "gtk-layer-shell"
        "swaync-control-center"
        "swaync-notification-window"
        "waybar"
      ];
    in [ "blur, ${toRegex layers}" "ignorealpha 0.5, ${toRegex layers}" ];

    # Window rules
    windowrulev2 = [

      #Vesktop
      "workspace 3, class:^(vesktop)$"

      #Xdg
      "float, class:^(xdg-desktop-portal-gtk)$"
      "size 900 500, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"

      #Steam
      "workspace 5,class:^(steam)"
      "float, class:(steam), title:(Friends List)"

      #TG
      "workspace 3, class:^(org.telegram.desktop)$"
      "size 900 500,title:^(Choose Files)"

      #Spotify
      "workspace 4, title:^(Spotify Free)$"

      #Firefox
      "workspace 2, class:^(firefox)$"
      "size 900 500, title:^(Save As)$"
      "dimaround, title:^(Save As)$"

      #Other
      "float,class:^(via-nativia)$"
    ];
  };
}
