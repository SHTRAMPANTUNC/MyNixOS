{...}: {
  security = {
    sudo.enable = true;

    doas = {
      enable = false;
      extraRules = [
        {
          groups = ["wheel"];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
