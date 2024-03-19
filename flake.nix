{
  inputs = {
    anyrun.url = "github:Kirottu/anyrun";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nix-gaming.url = "github:fufexan/nix-gaming";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    sops-nix = {
      url = "github:Mic92/sops-nix";
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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      overlays = [
        inputs.neovim-nightly-overlay.overlay
        inputs.nur.overlay
        (final: prev: {
          overVesktop = (prev.callPackage ./overlays/vesktop { });
          overHyprland = inputs.hyprland.packages.${prev.system}.hyprland;
          overHypr-portal = inputs.xdghypr.packages.${prev.system}.xdg-desktop-portal-hyprland;
          # overOpencore = (prev.callPackage ./overlays/opencore.nix { }); # Now i use GRUB
        })
      ];
      mkSystem = import ./lib/mkSystem.nix { inherit nixpkgs overlays inputs; };
    in {
      nixosConfigurations.jano = mkSystem "jano" {
        user = "kuper";
        system = "x86_64-linux";
      };

      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs; [ nixfmt nil sops age ];
        formatter = pkgs.nixfmt;
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
          "  | ${pkgs.lolcat}/bin/lolcat
        '';
      };
    };
}
