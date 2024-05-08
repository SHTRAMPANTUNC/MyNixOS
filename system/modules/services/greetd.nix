{
  pkgs,
  lib,
  user,
  inputs,
  ...
}: {
  security.pam.services.greetd = {enableGnomeKeyring = true;};
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = builtins.concatStringsSep " " [
          "${pkgs.greetd.tuigreet}/bin/tuigreet"
          "--asterisks"
          "--remember"
          "--time"
          "--cmd ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland"
        ];
        user = user;
      };
    };
  };
}
