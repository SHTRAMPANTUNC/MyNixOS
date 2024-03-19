{ config, inputs, pkgs, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
      ];

      width.fraction = 0.2;
      y.absolute = 50;
      hideIcons = true;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = false;
      maxEntries = 10;
    };

    extraCss = builtins.readFile (./. + "/style.css");

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          max_entries: 10,
          terminal: Some(${config.home.sessionVariables.TERMINAL}"),
        )
      '';
      "shell.ron".text = ''
        Config(
          prefix: ":",
        )
      '';
    };
  };
}
