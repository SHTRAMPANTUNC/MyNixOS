{
  config,
  pkgs,
  ...
}: {
  home = {
    pointerCursor = {
      package = pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 35;
      gtk.enable = true;
      x11.enable = true;
    };
    sessionVariables = {
      XCURSOR_SIZE = config.home.pointerCursor.size;
      XCURSOR_THEME = config.home.pointerCursor.name;
    };
  };
}
