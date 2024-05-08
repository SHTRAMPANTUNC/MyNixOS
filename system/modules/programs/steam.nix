{
  pkgs,
  user,
  ...
}: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [mangohud protonup];
  environment.sessionVariables = {
    STEAM_EXRTA_COMPAT_TOOLS_PATH = "/home/${user}.steam/root/compatibilitytools.d";
  };
}
