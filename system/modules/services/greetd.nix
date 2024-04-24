{
  pkgs,
  lib,
  user,
  inputs,
  ...
}: {
  security.pam.services.greetd = {enableGnomeKeyring = true;};
  services.greetd = let
    session = {
      command = "${lib.getExe inputs.hyprland.packages.${pkgs.system}.hyprland}";
      user = user;
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };
}
