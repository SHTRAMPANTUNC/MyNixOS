{
  description = "
    NixOS config
             By
               ██   ██ ██    ██ ██████  ███████ ██████  
               ██  ██  ██    ██ ██   ██ ██      ██   ██ 
               █████   ██    ██ ██████  █████   ██████  
               ██  ██  ██    ██ ██      ██      ██   ██ 
               ██   ██  ██████  ██      ███████ ██   ██ 
  ";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

      nixpkgs-f2k = {
        url = "github:fortuneteller2k/nixpkgs-f2k";
      };

      neovim-nightly-overlay = {
        url = "github:nix-community/neovim-nightly-overlay";
      };

      devenv = {
        url = "github:cachix/devenv";
      };

      nix-gaming = {
        url = "github:fufexan/nix-gaming";
      };

      spicetify-nix = {
        url = "github:the-argus/spicetify-nix";
      };

      firefox-addons = {
        url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      sops-nix = {
        url = "github:Mic92/sops-nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, nixpkgs, ... } @inputs: with inputs;
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      mkSystem = import ./lib/mkSystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      nixosConfigurations.jano = mkSystem "jano" rec {
        user = "kuper";
        system = "x86_64-linux";
      };
      devShells = {
        x86_64-linux.default = (
          import ./shell.nix {
            inherit inputs pkgs;
          }
        );
      };
    };
}
