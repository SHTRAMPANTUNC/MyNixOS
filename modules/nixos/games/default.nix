{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix-gaming.nixosModules.steamCompat
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
      ];
    };
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (steam.override {
      extraPkgs = pkgs: with pkgs; [
        pango
        harfbuzz
        libthai
      ];
    })
  ];
}
