{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.hyprland.nixosModules.default];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    HYPRCURSOR_SIZE = "35";
    HYPRCURSOR_THEME = "macOS-Monterey";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
  };
  home-manager.sharedModules = [inputs.hyprland.homeManagerModules.default];
}
