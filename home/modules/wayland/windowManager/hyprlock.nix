{
  inputs,
  pkgs,
  user,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];

  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;

    general = {
      disable_loading_bar = false;
      hide_cursor = true;
      grace = 0;
      no_fade_in = false;
    };

    backgrounds = [
      {
        monitor = ""; # All monitors
        path = "/home/${user}/MyNixOS/assets/walls/004.png";
        blur_passes = 2;
        brightness = 0.5;
      }
    ];

    input-fields = [
      {
        monitor = "";
        size = {
          width = 250;
          height = 60;
        };
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.5)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        placeholder_text = ''<b><span font_family="JetBrainsMono Nerd Font" foreground="##cdd6f4">Password...</span></b>'';
        hide_input = false;
        position = {
          x = 0;
          y = -150;
        };
        halign = "center";
        valign = "center";
      }
    ];

    labels = [
      {
        monitor = "";
        text = "$TIME";
        font_size = 120;
        position = {
          x = 0;
          y = 80;
        };
        valign = "center";
        halign = "center";
      }
    ];
  };
}
