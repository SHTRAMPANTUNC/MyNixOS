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
  services = {
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

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
