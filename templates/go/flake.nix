{
  description = "Go Template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};

        nativeBuildInputs = with pkgs; [
          go
          gopls
          gotools
        ];
        buildInputs = with pkgs; [impl delve];
      in {
        devShells.default = pkgs.mkShell {inherit nativeBuildInputs buildInputs;};

        packages.default = pkgs.buildGoModule rec {
          name = "some_name";
          src = ./.;

          inherit buildInputs;

          vendorHash = null;
        };
      }
    );
}
