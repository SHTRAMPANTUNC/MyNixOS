{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    location = "center";
    font = "JetBrainsMono Nerd Font 14";
    terminal = "${config.home.sessionVariables.TERMINAL}";
    plugins = with pkgs; [rofi-calc rofi-emoji];
    extraConfig = {
      modi = "drun,calc,window,emoji";
      display-drun = "APPS";
      display-calc = "CALC";
      display-window = "WINDOW";
      display-emoji = "EMOJI";
      drun-display-format = "{name}";
    };
  };
}
