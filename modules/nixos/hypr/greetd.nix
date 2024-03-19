{ pkgs, lib, user, ... }: {
  security.pam.services.greetd = { enableGnomeKeyring = true; };
  services.greetd = let
    session = {
      command = "${lib.getExe pkgs.overHyprland}";
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
