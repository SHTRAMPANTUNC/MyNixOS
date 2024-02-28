{ pkgs
, inputs
, ...
}:

{
  nixpkgs.overlays = [
    (_: _:
      {
        awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-luajit-git;
      })
  ];

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
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd startx";
          user = "kuper";
        };
      };
    };
    xserver = {
      displayManager = {
        startx.enable = true;
        defaultSession = "none+awesome";
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs; [
          luajitPackages.lgi
        ];
      };
    };
  };

  programs = {
    slock.enable = true;
    xss-lock.enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
