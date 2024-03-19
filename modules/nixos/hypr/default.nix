{ pkgs, inputs, ... }: {
  imports = [ ./greetd.nix inputs.hyprland.nixosModules.default ];
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    HYPRCURSOR_SIZE = "35";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
  };
  home-manager.sharedModules = [ inputs.hyprland.homeManagerModules.default ];
  security = { pam.services.hyprlock.text = "auth include login"; };
  xdg.portal = {
    enable = true;
    config.common = {
      default = "gtk";
      "org.freedesktop.impl.portal.Screencast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk overHypr-portal ];
  };
}
