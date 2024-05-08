{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.39.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-parts,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    stateVersion = "24.05";
    system = "x86_64-linux";
    helpers = import ./lib/helpers.nix {inherit inputs stateVersion;};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [system];
      flake = {
        nixosConfigurations = {
          jano = helpers.mkHost {
            hostname = "jano";
            user = "kuper";
          };
        };

        homeConfigurations = {
          "kuper" = helpers.mkHome {user = "kuper";};
        };

        devShells.x86_64-linux.default = pkgs.mkShell {
          packages = with pkgs; [alejandra nil deadnix sops age];
          name = "ღვინო";
          meta.description = "The default development shell for this flake";

          shellHook = ''
              clear
              echo "
                  ________    ___    __ __ ______
                 / ____/ /   /   |  / //_// ____/
                / /_  / /   / /| | / ,<  / __/
               / __/ / /___/ ___ |/ /| |/ /___
              /_/   /_____/_/  |_/_/ |_/_____/
            "  | ${pkgs.clolcat}/bin/clolcat
          '';
        };
        templates = import ./templates;
      };
    };
}
