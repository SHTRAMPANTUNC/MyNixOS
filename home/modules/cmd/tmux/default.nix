{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    keyMode = "vi";
    escapeTime = 0;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_status_left_separator "█"
        '';
      }
    ];
  };
}
