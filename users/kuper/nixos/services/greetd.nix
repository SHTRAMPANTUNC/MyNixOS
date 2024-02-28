{ pkgs
, config
, lib
, ...
}:

{
  console = {
    useXkbConfig = true;
    colors = [
      "45475A"
      "F38BA8"
      "A6E3A1"
      "F9E2AF"
      "89B4FA"
      "F5C2E7"
      "94E2D5"
      "BAC2DE"
      "585B70"
      "F38BA8"
      "A6E3A1"
      "F9E2AF"
      "89B4FA"
      "F5C2E7"
      "94E2D5"
      "A6ADC8"
    ];
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        terminal.vt = 1;
        default_session =
          {
            command = lib.concatStringsSep " " [
              (lib.getExe pkgs.greetd.tuigreet)
              "--time"
              "--remember"
              "--remember-user-session"
              "--asterisks"
              "--sessions 'startx'"
            ];
            user = "greeter";
          };
      };
    };
  };
}
