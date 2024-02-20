{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 15;
    };
    settings = {
      adjust_line_height = 8;
      url_style = "curly";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      background_opacity = "0.85";
      scrollback_lines = 99999;
      disable_ligatures = "always";
      repaint_delay = 0;
      input_delay = 0;
      sync_to_monitor = "no";


      #TAB
      tab_bar_style = "powerline";
      active_tab_foreground = "#11111B";
      active_tab_background = "#CBA6F7";
      active_tab_font_style = "bold";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      inactive_tab_font_style = "bold";
      tab_bar_background = "#11111B";

      selection_foreground = "#1e1e2e";
      selection_background = "#F5E0DC";

      cursor = "#F5E0DC";
      cursor_text_color = "#1E1E2E";

      background = "#1e1e2e";
      foreground = "#CDD6F4";

      color0 = "#45475A";
      color8 = "#585B70";

      color1 = "#F38BA8";
      color9 = "#F38BA8";

      color2 = "#A6E3A1";
      color10 = "#A6E3A1";

      color3 = "#F9E2AF";
      color11 = "#F9E2AF";

      color4 = "#89B4FA";
      color12 = "#89B4FA";

      color5 = "#F5C2E7";
      color13 = "#F5C2E7";

      color6 = "#94E2D5";
      color14 = "#94E2D5";

      color7 = "#BAC2DE";
      color15 = "#A6ADC8";
    };

    keybindings = {

      #Bind
      "ctrl+shift+k" = "next_tab";
      "ctrl+shift+j" = "previous_tab";

      #Disable 
      "ctrl+shift+r" = "no_op";
      "ctrl+shift+h" = "no_op";
      "ctrl+shift+e" = "no_op";
      "ctrl+shift+u" = "no_op";
      "ctrl+shift+esc" = "no_op";
    };
  };
}
