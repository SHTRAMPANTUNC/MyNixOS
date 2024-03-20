{pkgs, ...}: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [prettybat batman batgrep batdiff];
  };
}
