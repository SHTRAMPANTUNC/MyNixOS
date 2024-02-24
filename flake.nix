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

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = { self, ... } @inputs: with inputs;
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default = (import ./shell.nix { inherit pkgs; });

      nixosConfigurations = {
        jano = nixpkgs.lib.nixosSystem {
          modules = [
            ./modules
            ./host
          ];
          specialArgs = {
            inherit inputs outputs;
            root = ./.;
            user = "kuper";
          };
        };
      };
    };
}
