{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  services.hypridle = let
    hyprlockExe = lib.getExe config.programs.hyprlock.package;
  in {
    enable = true;
    package = pkgs.hypridle;

    listeners = [
      {
        timeout = 600;
        onTimeout = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms off";
        onResume = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/hyprctl dispatch dpms on";
      }
      {
        timeout = 900;
        onTimeout = hyprlockExe;
        onResume = "";
      }
    ];

    lockCmd = hyprlockExe;
    beforeSleepCmd = hyprlockExe;
    unlockCmd = "";
    afterSleepCmd = "";
  };

  systemd.user.services.hypridle = {
    Service.Slice = "session.slice";
    Unit.After = lib.mkForce [];
    Unit.PartOf = lib.mkForce ["hyprland-session.target"];
    Install.WantedBy = lib.mkForce ["hyprland-session.target"];
  };
}
