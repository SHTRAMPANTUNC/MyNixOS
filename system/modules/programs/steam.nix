{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = false;
    };
    gamemode.enable = false;
    gamescope.enable = false;
  };
}
