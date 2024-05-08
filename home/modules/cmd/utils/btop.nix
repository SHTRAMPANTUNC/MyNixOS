{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "onedark";
      theme_background = false;
      vim_keys = true;
      update_ms = 100;
    };
  };
}
